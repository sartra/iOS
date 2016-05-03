//
//  BandsListViewController.swift
//  bands
//
//  Created by Sarah Renshaw on 5/1/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit
import Alamofire

class BandsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var bandsTable: UITableView!
    
    var bandsArray = Array<Bands>() //the object class defined in models folder
    
    
    override func loadView(){  //every view controller has to have this loadView function
        //        self.moviesArray = ["Avatar", "Godfater", "Back To the Future", "Toy Story"]
        
        let frame = UIScreen.mainScreen().bounds // grabs the full screen size
        let view = UIView(frame: frame) // create a view whose frame occupies the full screen of whatever device
        
        
        self.bandsTable = UITableView(frame: frame, style: .Plain)
        view.addSubview(self.bandsTable) //adds the table to the screen
        
        //set data source
        self.bandsTable.dataSource = self
        self.bandsTable.delegate = self
        
        self.view = view // hands this view off to the controller
        

        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let band = self.bandsArray[indexPath.row]
            print("SELECTED: "+band.title)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/band"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                //                print("\(json)")
                
                if let bands = json["bands"] as? Array<Dictionary<String, AnyObject>>{
                    for i in 0..<bands.count {
                        let bandDict = bands[i]
                        print("BANDS: \(bandDict)")
                        
                        let band = Bands()
                        band.title = bandDict["title"] as? String
                        band.leadSinger = bandDict["leadSinger"] as? String
                        band.country = bandDict["country"] as? String
                        band.tour = bandDict["tour"] as? String
                        band.image = bandDict["image"] as? String
                        self.bandsArray.append(band)
                    }
                    self.bandsTable.reloadData()
                }
            }
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // TView asks data source how many rows you want
        return self.bandsArray.count // create rows based on length of bands array
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//what cell displays
        // reuse cells in table to conserve memory
        
        let band = self.bandsArray[indexPath.row]  // indexPath has two piece of info: section and row
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = band.title + ", " + band.leadSinger
            cell.detailTextLabel?.text = band.leadSinger
            cell.imageView?.image = UIImage(named: band.image)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        //        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.text = band.title + ", " + band.leadSinger
        cell.detailTextLabel?.text = band.leadSinger
        cell.imageView?.image = UIImage(named: band.image)
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let band = self.bandsArray[indexPath.row]
        print("SELECTED: \(band.title)")
        
        
        let bandDetailVc = BandsDetailViewController()
        bandDetailVc.selectedBand = band
        self.navigationController?.pushViewController(bandDetailVc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
