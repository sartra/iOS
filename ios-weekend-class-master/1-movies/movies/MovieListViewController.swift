//
//  MovieListViewController.swift
//  movies
//
//  Created by Dan Kwon on 5/1/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit
import Alamofire

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moviesTable: UITableView!
    var moviesArray = Array<Movie>()
    
    override func loadView() {
//        self.moviesArray = ["Avatar", "Godfather", "Back to the Future", "Toy Story"]
        
//        let avatar = Movie()
//        avatar.title = "Avatar"
//        avatar.year = "2009"
//        avatar.image = "avatar.png"
//        avatar.leadActor = "Sam Worthington"
//        avatar.summary = "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home."
//        self.moviesArray.append(avatar)
//
//        let godFather = Movie()
//        godFather.title = "The Godfather"
//        godFather.year = "1973"
//        godFather.image = "godfather.png"
//        godFather.leadActor = "Al Pacino"
//        godFather.summary = "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."
//        self.moviesArray.append(godFather)
//
//        let toyStory = Movie()
//        toyStory.title = "Toy Story"
//        toyStory.year = "1995"
//        toyStory.image = "toystory.png"
//        toyStory.leadActor = "Tom Hanks"
//        toyStory.summary = "A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room."
//        self.moviesArray.append(toyStory)
//
//        let jungleBook = Movie()
//        jungleBook.title = "Jungle Book"
//        jungleBook.year = "2016"
//        jungleBook.image = "junglebook.png"
//        jungleBook.leadActor = "Bill Murray"
//        jungleBook.summary = "The man-cub Mowgli flees the jungle after a threat from the tiger Shere Khan. Guided by Bagheera the panther and the bear Baloo, Mowgli embarks on a journey of self-discovery, though he also meets creatures who don't have his best interests at heart."
//        
//        self.moviesArray.append(jungleBook)

        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .redColor()
        
        self.moviesTable = UITableView(frame: frame, style: .Plain)
        self.moviesTable.dataSource = self
        self.moviesTable.delegate = self
        view.addSubview(self.moviesTable)
        
        
        
        self.view = view
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/movie"
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject> {
//                print("\(json)")
                
                if let movies = json["movies"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for movieDict in movies {
                        let movie = Movie()
                        movie.title = movieDict["title"] as? String
                        movie.year = movieDict["year"] as? String
                        movie.summary = movieDict["summary"] as? String
                        movie.leadActor = movieDict["leadActor"] as? String
                        movie.image = movieDict["image"] as? String
                        
                        self.moviesArray.append(movie)
                    }
                    
                    self.moviesTable.reloadData()
                    
                    
                }
                
            }

            
        }
        
        
        
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moviesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movie = self.moviesArray[indexPath.row]
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = movie.title+", "+movie.year
            cell.detailTextLabel?.text = movie.leadActor
            cell.imageView?.image = UIImage(named: movie.image)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = movie.title+", "+movie.year
        cell.detailTextLabel?.text = movie.leadActor
        cell.imageView?.image = UIImage(named: movie.image)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie = self.moviesArray[indexPath.row]
        print("SELECTED: \(movie.title)")
        
        let movieDetailVc = MovieDetailViewController()
        movieDetailVc.selectedMovie = movie
        self.navigationController?.pushViewController(movieDetailVc, animated: true)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
