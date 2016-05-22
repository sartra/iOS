//
//  ShowsListViewController.swift
//  tv-shows
//
//  Created by Dan Kwon on 5/8/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit
import Alamofire

class ShowsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var showsTable: UITableView!
    var showsList = Array<TVShow>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/show"
        Alamofire.request(.GET, url, parameters:nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject> {
                print("\(json)")
                
                if let shows = json["shows"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for showInfo in shows {
                        let show = TVShow()
                        show.populate(showInfo)
                        self.showsList.append(show)
                    }
                    
                    self.showsTable.reloadData()
                    
                }
            }
            
        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.showsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tvShow = self.showsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
        cell.textLabel?.text = tvShow.title
        cell.detailTextLabel?.text = tvShow.network
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("didSelectRowAtIndexPath:")
        
        
        let tvShow = self.showsList[indexPath.row]
        
        let showVc = ShowViewController()
        showVc.selectedShow = tvShow
        self.navigationController?.pushViewController(showVc, animated: true)
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
