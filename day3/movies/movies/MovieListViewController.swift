//
//  MovieListViewController.swift
//  movies
//
//  Created by Sarah Renshaw on 5/1/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit
import Alamofire

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var moviesTable: UITableView!
    
    var moviesArray = Array<Movie>() //Movies is the movie object class defined in models folder - it is created and declared at the same time with the '=' rather than ':' and add '()' at end
    
    
    override func loadView(){  //every view controller has to have this loadView function
//        self.moviesArray = ["Avatar", "Godfater", "Back To the Future", "Toy Story"]
        
        let frame = UIScreen.mainScreen().bounds // grabs the full screen size
        let view = UIView(frame: frame) // create a view whose frame occupies the full screen of whatever device
        
        
        self.moviesTable = UITableView(frame: frame, style: .Plain)
        view.addSubview(self.moviesTable) //adds the table to the screen
        
        //set data source
        self.moviesTable.dataSource = self
        self.moviesTable.delegate = self
        
        self.view = view // hands this view off to the controller
        
        
//        let avatar = Movie()  //creates a movie object
//        avatar.title = "Avatar"
//        avatar.year = "2009"
//        avatar.leadActor = "Sam Worthington"
//        avatar.image = "avatar.png"
//        avatar.summary = "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home."
//        self.moviesArray.append(avatar)
//        
//        let godfather = Movie()  //creates a movie object
//        godfather.title = "The Godfather"
//        godfather.year = "1973"
//        godfather.leadActor = "Al Pacino"
//        godfather.image = "godfather.png"
//        godfather.summary = "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
//        self.moviesArray.append(godfather)
//        
//        let toystory = Movie()  //creates a movie object
//        toystory.title = "Toy Story"
//        toystory.year = "1995"
//        toystory.leadActor = "Tom Hanks"
//        toystory.image = "toystory.png"
//        toystory.summary = "A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room."
//        self.moviesArray.append(toystory)
//        
//        let jungleBook = Movie()  //creates a movie object
//        jungleBook.title = "Jungle Book"
//        jungleBook.year = "2016"
//        jungleBook.leadActor = "Bill Murray"
//        jungleBook.image = "junglebook.png"
//        jungleBook.summary = "The man-cub Mowgli flees the jungle after a threat from the tiger Shere Khan. Guided by Bagheera the panther and the bear Baloo, Mowgli embarks on a journey of self-discovery, though he also meets creatures who don't have his best interests at heart."
//        self.moviesArray.append(jungleBook)
        
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            let movie = self.moviesArray[indexPath.row]
//            print("SELECTED: \(movie.title)")
            print("SELECTED: "+movie.title)

        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/movie"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
//                print("\(json)")
                
                if let movies = json["movies"] as? Array<Dictionary<String, AnyObject>>{
                    for i in 0..<movies.count {
                        let movieDict = movies[i]
                        print("MOVIE: \(movieDict)")
                        
                        let movie = Movie()
                        movie.title = movieDict["title"] as? String
                        movie.year = movieDict["year"] as? String
                        movie.leadActor = movieDict["leadActor"] as? String
                        movie.summary = movieDict["summary"] as? String
                        movie.image = movieDict["image"] as? String
                        self.moviesArray.append(movie)
                    }
                    self.moviesTable.reloadData()
                }
            }
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // TView asks data source how many rows you want
        return self.moviesArray.count // create rows based on length of movies array
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//what cell displays
        // reuse cells in table to conserve memory
        
        let movie = self.moviesArray[indexPath.row]  // indexPath has two piece of info: section and row
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = movie.title + ", " + movie.year
            cell.detailTextLabel?.text = movie.leadActor
            cell.imageView?.image = UIImage(named: movie.image)
            return cell
        }

        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
//        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.text = movie.title + ", " + movie.year
        cell.detailTextLabel?.text = movie.leadActor
        cell.imageView?.image = UIImage(named: movie.image)
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let movie = self.moviesArray[indexPath.row]
        print("SELECTED: \(movie.title)")
        
        
        let movieDetailVc = BlueViewController()
        movieDetailVc.selectedMovie = movie
        self.navigationController?.pushViewController(movieDetailVc, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
