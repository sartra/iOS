//
//  BandsDetailViewController.swift
//
//
//  Created by Sarah Renshaw on 5/1/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class BandsDetailViewController: UIViewController {
    
    var selectedBand: Bands!
    
    
    override func loadView(){
        
        self.edgesForExtendedLayout = .None
        self.title = self.selectedBand.title
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .darkGrayColor()
        
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width))
        background.image = UIImage(named: self.selectedBand.image)
        view.addSubview(background)
        
        let darkScreen = UIView(frame: frame)
        darkScreen.backgroundColor = .blackColor()
        darkScreen.alpha = 0.7
        view.addSubview(darkScreen)
        
        
        let scrollview = UIScrollView(frame:frame)
        scrollview.backgroundColor = .clearColor()
        
        
        let bandImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bandImage.image = UIImage(named: self.selectedBand.image)
        bandImage.center = CGPoint(x: 0.5*frame.size.width, y: 80)
        bandImage.layer.borderColor = UIColor.whiteColor().CGColor
        bandImage.layer.borderWidth = 2
        bandImage.layer.cornerRadius = 50
        bandImage.layer.masksToBounds = true
        scrollview.addSubview(bandImage)
        
        let padding = CGFloat(24)
        let y = bandImage.frame.origin.y+bandImage.frame.size.height+padding // pins it below the image 12px
        let width = frame.size.width-2*padding
        let font = UIFont(name: "Arial", size: 14)!
        let bandStr = NSString(string: self.selectedBand.title)
        let bounds = bandStr.boundingRectWithSize(CGSizeMake(width, 600),
                                                   options: .UsesLineFragmentOrigin,
                                                   attributes: [NSFontAttributeName:font],
                                                   context: nil)
        
        let lblSummary = UILabel(frame: CGRect(x: padding, y: y, width: width, height: bounds.size.height))
        lblSummary.backgroundColor = .clearColor()
        lblSummary.textColor = .whiteColor()
        lblSummary.font = font
        lblSummary.textAlignment = .Center
        lblSummary.text = self.selectedBand.title
        lblSummary.lineBreakMode = .ByWordWrapping
        lblSummary.numberOfLines = 0  //unlimited number of lines
        scrollview.addSubview(lblSummary)
        
        view.addSubview(scrollview)
        
        self.view = view
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
