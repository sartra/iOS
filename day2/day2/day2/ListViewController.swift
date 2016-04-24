//
//  ListViewController.swift
//  day2
//
//  Created by Sarah Renshaw on 4/24/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { // conform to tableViewDelegate protocol
    
    
    
//    override func loadView(){ // to create view programmatically, not with storyboard
//        self.edgesForExtendedLayout = .None
//        let frame = UIScreen.mainScreen().bounds // frame is based on user's device 
////        let maxHeight = frame.size.height
//        let width = frame.size.width - 40
//        let view = UIView(frame: frame)
//        view.backgroundColor = UIColor.orangeColor()
//        
//        let scrollview = UIScrollView(frame: frame)
//        scrollview.backgroundColor = UIColor.yellowColor()
//        view.addSubview(scrollview)
//        
////        let btn = UIButton(frame: CGRect(x: 20, y:100, width: 150, height: 44))
//        
//        var y = CGFloat(100)
//        
//        for i in 0...10{
//            let btn = UIButton(frame: CGRect(x: 20, y:y, width: width, height: 44))
//            btn.backgroundColor = UIColor.greenColor()
//            scrollview.addSubview(btn)
//            y += 64
//        }
//        
//        scrollview.contentSize = CGSize(width: 0, height: y+64)
//
//        self.view = view
//    }

    
    var namesTable: UITableView!
    var namesArray: Array<String>!

    override func loadView() {
//        self.namesArray = ["donald trump", "hillary clinton", "bernie sanders", "alfonso"]
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.orangeColor()
        
        self.namesTable = UITableView(frame: frame, style: .Plain)
        
        view.addSubview(self.namesTable)
        
        self.namesTable.dataSource = self
        self.namesTable.delegate = self
        
        self.view = view
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return 200 // 20 rows
          return self.namesArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cellId = "cellID"
            if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
                print("ReUse Cell")
                cell.textLabel?.text = self.namesArray[indexPath.row]
                return cell
            }
        
            print("Create New Cell")
            let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = self.namesArray[indexPath.row]
        return cell
            return cell
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
