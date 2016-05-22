//
//  ShowViewController.swift
//  tv-shows
//
//  Created by Dan Kwon on 5/8/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedShow: TVShow!
    var castTable: UITableView!
    
    override func loadView() {
        self.edgesForExtendedLayout = .None
        self.title = self.selectedShow.title
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .redColor()
        
        
        let showImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        showImage.center = CGPoint(x: 0.5*frame.size.width, y: 90)
        showImage.backgroundColor = .greenColor()
        view.addSubview(showImage)
        
        var y = showImage.frame.origin.y+showImage.frame.size.height+20
        
        let font = UIFont(name: "Arial", size: 16)
        let str = NSString(string: self.selectedShow.summary)
        
        let bounds = str.boundingRectWithSize(CGSizeMake(frame.size.width-40, 900),
                                              options: .UsesLineFragmentOrigin,
                                              attributes: [NSFontAttributeName:font!],
                                              context: nil)
        
        
        let summaryLabel = UILabel(frame: CGRect(x: 20, y: y, width: frame.size.width-40, height: bounds.size.height))
        summaryLabel.font = font
        summaryLabel.numberOfLines = 0
        summaryLabel.lineBreakMode = .ByWordWrapping
        summaryLabel.text = self.selectedShow.summary
        summaryLabel.textColor = .whiteColor()
        view.addSubview(summaryLabel)
        y = y+summaryLabel.frame.size.height+20
        
        let tableFrame = CGRect(x: 0, y: y, width: frame.size.width, height: frame.size.height-y)
        
        self.castTable = UITableView(frame: tableFrame, style: .Plain)
        self.castTable.autoresizingMask = .FlexibleHeight
        self.castTable.dataSource = self
        self.castTable.delegate = self
        view.addSubview(self.castTable)
        
        
        
        
        self.view = view
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedShow.cast.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let actor = self.selectedShow.cast[indexPath.row]
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId) {
            cell.textLabel?.text = actor
            return cell
        }

        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = actor
        return cell

    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return "Cast Members"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
