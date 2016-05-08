//
//  ShowsListViewController.swift
//  tv-shows
//
//  Created by Sarah Renshaw on 5/8/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit
import Alamofire

class ShowsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var showTable: UITableView!
    
    var showsList = Array<TVShow>()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://movie-list.herokuapp.com/api/show"
        Alamofire.request(.GET, url, parameters:nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                print("\(json)")
                
                if let shows = json["shows"] as? Array<Dictionary<String, AnyObject>> {
                    
                    for showInfo in shows {
                        let show = TVShow()
                        show.populate(showInfo)
                        self.showsList.append(show)
                        
//                        show.title = showInfo["title"] as? String
//                        show.network = showInfo["network"] as? String
//                        show.summary = showInfo["summary"] as? String
//                        show.cast = showInfo["cast"] as? Array<String>
                        
                    }
                    self.showTable.reloadData()
                }
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//      return 20
        return self.showsList.count
    
    }

    // control click the UITableViewDataSource ln 350-357
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let tvShow = self.showsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath)
            cell.textLabel?.text = tvShow.title
            cell.detailTextLabel?.text = tvShow.network
            return cell
    }
    
    


        
  
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //right click viewTableDelegate: this funciton is line 140
        print("didSelectRowAtIndexPath:")
        
        let tvShow = self.showsList[indexPath.row]
        
        let showVc = ShowSummaryViewController()    //goes to summary VC when cell is clicked
        showVc.selectedShow = tvShow
        self.navigationController?.pushViewController(showVc, animated: true)
        

    }


}
