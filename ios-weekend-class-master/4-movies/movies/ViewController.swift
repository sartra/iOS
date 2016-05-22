//
//  ViewController.swift
//  movies
//
//  Created by Dan Kwon on 5/15/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var moviesTable: UITableView!
    var movies = Array<Movie>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
//        let notification = NSNotification(name: "ImageDownloaded", object: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(ViewController.refreshView),
                                       name: Constants.kImageDownloadedNotfication,
                                       object: nil)


        
        
        
        let url = "http://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=98b525225a2fe71d855108eca4fdf12d"
        
        Alamofire.request(.GET, url, parameters:nil).responseJSON { response in
//            print("\(response)")
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                print("\(json)")
                
                if let results = json["results"] as? Array<Dictionary<String, AnyObject>> {
                    for movieInfo in results {
                        let movie = Movie()
                        movie.populate(movieInfo)
                        self.movies.append(movie)
                    }
                    
                    self.moviesTable.reloadData()
                }
            }
            
        }
        
    }

    func refreshView(){
        self.moviesTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        cell.textLabel?.text = movie.title
        let rating = String(format: "%.01f", movie.popularity!)
        cell.detailTextLabel?.text = "Popularity: \(rating)"
        
        
        if (movie.posterImage != nil){
            cell.imageView?.image = movie.posterImage
            return cell
        }
        
        
        movie.fetchPosterImage()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movieDetailVc = MovieDetailViewController()
        movieDetailVc.movie = self.movies[indexPath.row]
        self.navigationController?.pushViewController(movieDetailVc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

