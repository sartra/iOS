//
//  Movie.swift
//  movies
//
//  Created by Dan Kwon on 5/15/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit
import Alamofire

class Movie: NSObject {
    
    var title: String?
    var popularity: Double?
    var poster: String?
    var posterImage: UIImage?
    var isFetchingImage = false
    
    func fetchPosterImage(){
        if (self.poster == nil){ // no poster, ignore
            return
        }
        
        if (self.isFetchingImage == true){
            return
        }
        
        
        self.isFetchingImage = true
        let url = "http://image.tmdb.org/t/p/w500/"+self.poster!
        Alamofire.request(.GET, url, parameters: nil).response { (request, response, data, error) in
            self.isFetchingImage = false
            
            if (error != nil){
                return
            }
            
            let image = UIImage(data: data!)
            self.posterImage = image
            
            let notificationCenter = NSNotificationCenter.defaultCenter()
            let notification = NSNotification(name: Constants.kImageDownloadedNotfication, object: nil)
            notificationCenter.postNotification(notification)
            
        }
        
//        Alamofire.request('GET', url, nil, function(request, response, data, error){
//            
//        })
        
        
        
    }
    
    func populate(info: Dictionary<String, AnyObject>){
        
        if let _title = info["title"] as? String {
            self.title = _title
        }

        // IMAGE PATH: http://image.tmdb.org/t/p/w500/zSouWWrySXshPCT4t3UKCQGayyo.jpg
        // http://image.tmdb.org/t/p/w500/{{ poster }}
        
        if let _poster = info["poster_path"] as? String {
            self.poster = _poster
        }
        
        if let _popularity = info["popularity"] as? Double {
            self.popularity = _popularity
        }

    }

}
