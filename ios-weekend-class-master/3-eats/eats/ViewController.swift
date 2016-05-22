//
//  ViewController.swift
//  eats
//
//  Created by Dan Kwon on 5/8/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var locationManager: CLLocationManager!
    @IBOutlet var venuesTable: UITableView!
    var venues = Array<Venue>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.venues.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let venue = self.venues[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        cell.textLabel?.text = venue.name
        cell.detailTextLabel?.text = venue.address
        
        return cell
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        print("didChangeAuthorizationStatus")
        if (status == .AuthorizedWhenInUse){
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let currentLocation = locations[0]
        self.locationManager.stopUpdatingLocation()
        print("didUpdateLocations: \(currentLocation)")
        
        let latLng = "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
        
//        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
//        let params = ["location":latLng, "radius":"500", "types":"food", "key":"AIzaSyAeser88W3M1xByLny2F3RJCu8cMuLViUs"]
       
        let url = "https://api.foursquare.com/v2/venues/search?v=20140806&ll=\(latLng)&client_id=VZZ1EUDOT0JYITGFDKVVMCLYHB3NURAYK3OHB5SK5N453NFD&client_secret=UAA15MIFIWVKZQRH22KPSYVWREIF2EMMH0GQ0ZKIQZC322NZ"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                
                if let resp = json["response"] as? Dictionary<String, AnyObject>{
                    print("\(resp)")
                    
                    if let venues = resp["venues"] as? Array<Dictionary<String, AnyObject>>{
                        print("\(venues)")
                        
                        for venueInfo in venues {
                            let venue = Venue()
                            venue.populate(venueInfo)
                            self.venues.append(venue)
                        }
                        
                        self.venuesTable.reloadData()
                    }
                }
            }
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

