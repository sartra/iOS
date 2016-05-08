//
//  ShowSummaryViewController.swift
//  tv-shows
//
//  Created by Sarah Renshaw on 5/8/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ShowSummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedShow: TVShow!
    
    var castTable: UITableView!
    
    override func loadView(){
        
        
        self.edgesForExtendedLayout = .None
        self.title = self.selectedShow.title
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .darkGrayColor()
        
//        let scrollview = UIScrollView(frame:frame)
//        scrollview.backgroundColor = .clearColor()
        
        
        let showImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        showImage.image = UIImage(named: self.selectedShow.image)
        showImage.backgroundColor = .greenColor()
        showImage.center = CGPoint(x: 0.5*frame.size.width, y: 100)
        showImage.layer.borderColor = UIColor.whiteColor().CGColor
        showImage.layer.borderWidth = 2
//        showImage.layer.cornerRadius = 50
        showImage.layer.masksToBounds = true
        view.addSubview(showImage)
        
        
        let padding = CGFloat(24)
        var y = showImage.frame.origin.y+showImage.frame.size.height+padding // pins it below the image 12px
        let width = frame.size.width-2*padding
        let font = UIFont(name: "Arial", size: 16)!
        
        let showStr = NSString(string: self.selectedShow.summary)  //NSS string has a function needed that swift doesnt have yet
        let bounds = showStr.boundingRectWithSize(CGSizeMake(width, 900),
                                                  options: .UsesLineFragmentOrigin,
                                                  attributes: [NSFontAttributeName:font],
                                                  context: nil)    //bounding box for the lblSummary (summary text field)
        
        let lblSummary = UILabel(frame: CGRect(x: padding, y: y, width: width, height: bounds.size.height+10))
        lblSummary.backgroundColor = .clearColor() //.clearColor()
        lblSummary.textColor = .whiteColor()
        lblSummary.font = font
        lblSummary.textAlignment = .Center
        lblSummary.text = self.selectedShow.summary
        lblSummary.lineBreakMode = .ByWordWrapping
        lblSummary.numberOfLines = 0  //unlimited number of lines
        view.addSubview(lblSummary)
        
        y = y+lblSummary.frame.size.height
        
        let tableFrame = CGRect(x: 0, y: y, width: frame.size.width, height: frame.size.height)
        
        self.castTable = UITableView(frame: tableFrame, style: .Plain)
        self.castTable.autoresizingMask = .FlexibleHeight
        self.castTable.dataSource = self
        self.castTable.delegate = self
        view.addSubview(self.castTable)
        
//        view.addSubview(scrollview)
        
        
        self.view = view
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedShow.cast.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        let actor = self.selectedShow.cast[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = actor  //was:   "\(indexPath.row)"
            return cell
            }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)

        cell.textLabel?.text = actor
        return cell
        
    }
    
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
