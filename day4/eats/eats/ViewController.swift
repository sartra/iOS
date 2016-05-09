//
//  ViewController.swift
//  eats
//
//  Created by Sarah Renshaw on 5/8/16.
//  Copyright © 2016 sartra. All rights reserved.
//


import UIKit
import CoreLocation
import Alamofire


class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var locationManager: CLLocationManager!
    
    var restaurantTable: UITableView!
    
    var restaurant: restaurants!
    
    var places = [Dictionary<String, AnyObject>]()
    

    override func loadView(){
        self.edgesForExtendedLayout = .None
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        
//        let width = frame.size.width-20
//        
//        let font = UIFont(name: "Arial", size: 16)!
//        
//        let showStr = NSString(string: self.restaurants.name)
//        let bounds = showStr.boundingRectWithSize(CGSizeMake(width, 200),
//                                                  options: .UsesLineFragmentOrigin,
//                                                  attributes: [NSFontAttributeName:font],
//                                                  context: nil)
//        
//        
//        
//        let padding = CGFloat(24)
//        var y = showImage.frame.origin.y+showImage.frame.size.height+padding // pins it below the image 12px
//        let width = frame.size.width-2*padding
//        let font = UIFont(name: "Arial", size: 16)!
//        
//        let showStr = NSString(string: self.selectedShow.summary)  //NSS string has a function needed that swift doesnt have yet
//        let bounds = showStr.boundingRectWithSize(CGSizeMake(width, 900),
//                                                  options: .UsesLineFragmentOrigin,
//                                                  attributes: [NSFontAttributeName:font],
//                                                  context: nil)    //bounding box for the lblSummary (summary text field)
        
        
//        let lblSummary = UILabel(frame: CGRect(x: padding, y: y, width: width, height: bounds.size.height+10))
//        
//        y = y+lblSummary.frame.size.height + 20
//        let tableFrame = CGRect(x: 0, y: y, width: frame.size.width, height: frame.size.height)
        
        
        
        self.restaurantTable = UITableView(frame: frame, style: .Plain)
        self.restaurantTable.autoresizingMask = .FlexibleHeight
        self.restaurantTable.dataSource = self
        self.restaurantTable.delegate = self
        view.addSubview(self.restaurantTable)
        
        self.view = view
   
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return self.places.count
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellId = "cellId"
//        let place = self.restaurants.name[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)" //  "\(indexPath.row)"
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.759211,-73.984638&radius=500&types=food&key=AIzaSyCPdLW5VLngUoO8ttk6jLBR2ZArvdA3Kw8"
        Alamofire.request(.GET, url, parameters:nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                print("\(json)")
                
                if let places = json["results"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for placeInfo in places {
                        self.places.append(placeInfo)
                    }
                    self.restaurantTable.reloadData()
                }
            }
        }
    
        
    }
    
    
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus){
        print("didChangeAuthorizationStatus")
        
        if (status == .AuthorizedWhenInUse){
            self.locationManager.startUpdatingLocation()
        }
    }

   
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let currentLocation = locations[0]
        self.locationManager.stopUpdatingLocation()
        print("didUpdateLocations: \(currentLocation)")
        
        let latLng = "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
        
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latLng)&radius=500&types=food&key=AIzaSyCPdLW5VLngUoO8ttk6jLBR2ZArvdA3Kw8"
        
        print("URL = \(url)")
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                print("\(json)")
                
                if let results = json["results"] as? Array<Dictionary<String, AnyObject>>{
                    print("\(results)")
                }
            }
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}






//   https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670,151.1957&radius=500&types=food&key=AIzaSyCPdLW5VLngUoO8ttk6jLBR2ZArvdA3Kw8


// Google locations API Key:  AIzaSyCPdLW5VLngUoO8ttk6jLBR2ZArvdA3Kw8