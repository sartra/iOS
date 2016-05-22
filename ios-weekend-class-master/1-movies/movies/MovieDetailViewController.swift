//
//  MovieDetailViewController.swift
//  movies
//
//  Created by Dan Kwon on 5/1/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var selectedMovie: Movie!
    
    override func loadView() {
        self.edgesForExtendedLayout = .None
        self.title = self.selectedMovie.title
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .darkGrayColor()
        
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width))
        background.image = UIImage(named: self.selectedMovie.image)
        view.addSubview(background)
        
        let darkScreen = UIView(frame: frame)
        darkScreen.backgroundColor = .blackColor()
        darkScreen.alpha = 0.7
        view.addSubview(darkScreen)
        
        
        let scrollview = UIScrollView(frame: frame)
        scrollview.backgroundColor = .clearColor()
        
        let movieImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        movieImage.image = UIImage(named: self.selectedMovie.image)
        movieImage.center = CGPoint(x: 0.5*frame.size.width, y: 80)
        movieImage.layer.borderColor = UIColor.whiteColor().CGColor
        movieImage.layer.borderWidth = 2
        movieImage.layer.cornerRadius = 50
        movieImage.layer.masksToBounds = true
        scrollview.addSubview(movieImage)
        
        let padding = CGFloat(24)
        let y = movieImage.frame.origin.y+movieImage.frame.size.height+padding
        
        let font = UIFont(name: "Arial", size: 16)!
        let width = frame.size.width-2*padding
        let movieStr = NSString(string: self.selectedMovie.summary)
        let bounds = movieStr.boundingRectWithSize(CGSizeMake(width, 600),
                                                   options: .UsesLineFragmentOrigin,
                                                   attributes: [NSFontAttributeName:font],
                                                   context: nil)
        
        
        let lblSummary = UILabel(frame: CGRect(x: padding, y: y, width: width, height: bounds.size.height))
        lblSummary.backgroundColor = .clearColor()
        lblSummary.textColor = .whiteColor()
        lblSummary.font = font
        lblSummary.textAlignment = .Center
        lblSummary.text = self.selectedMovie.summary
        lblSummary.lineBreakMode = .ByWordWrapping
        lblSummary.numberOfLines = 0 // unlimited number of lines
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
