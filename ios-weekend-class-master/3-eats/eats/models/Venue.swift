//
//  Venue.swift
//  eats
//
//  Created by Dan Kwon on 5/15/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class Venue: NSObject {

    var name: String!
    var address: String!
    
    func populate(info: Dictionary<String, AnyObject>){
        
        if let _name = info["name"] as? String {
            self.name = _name
            
        }

        if let location = info["location"] as? Dictionary<String, AnyObject> {
            if let _address = location["address"] as? String {
                self.address = _address
            }
        }

    }
}
