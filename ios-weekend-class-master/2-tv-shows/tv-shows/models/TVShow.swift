//
//  TVShow.swift
//  tv-shows
//
//  Created by Dan Kwon on 5/8/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class TVShow: NSObject {
    
    var title: String!
    var network: String!
    var summary: String!
    var cast: Array<String>!
    
    func populate(info: Dictionary<String, AnyObject>){
        
        if let _title = info["title"] as? String {
            self.title = _title
        }

        if let _network = info["network"] as? String {
            self.network = _network
        }

        if let _summary = info["summary"] as? String {
            self.summary = _summary
        }

        if let _cast = info["cast"] as? Array<String> {
            self.cast = _cast
        }

        
        
    }

}
