//
//  MovieDetailViewController.swift
//  movies
//
//  Created by Dan Kwon on 5/15/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController, UIScrollViewDelegate {

    var movie: Movie!
    var moviePoster: UIImageView!
    
    override func loadView() {
        self.title = self.movie.title
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .blackColor()
        
        self.moviePoster = UIImageView(image: self.movie.posterImage)
        let posterFrame = self.moviePoster.frame
        
        let width = frame.size.width
        let scale = width/posterFrame.size.width
        let height = scale * posterFrame.size.height
        self.moviePoster.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        view.addSubview(self.moviePoster)
        
        
        let screen = UIView(frame: frame)
        screen.backgroundColor = .blackColor()
        screen.alpha = 0.6
        view.addSubview(screen)
        
        let scrollview = UIScrollView(frame: frame)
        scrollview.delegate = self
        scrollview.contentSize = CGSize(width: 0, height: 1000)
        
        let movieIcon = UIImageView(image: self.movie.posterImage)
        movieIcon.frame = CGRect(x: 0, y: 0, width: 0.5*width, height: 0.5*height)
        movieIcon.center = CGPoint(x: 0.5*frame.size.width, y: 240)
        movieIcon.layer.borderColor = UIColor.whiteColor().CGColor
        movieIcon.layer.borderWidth = 3
        scrollview.addSubview(movieIcon)
        view.addSubview(scrollview)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = scrollView.contentOffset.y
        print("\(offset)") // 0 to 300
        
        if (offset > 0){
            self.moviePoster.transform = CGAffineTransformIdentity
            var frame = self.moviePoster.frame
            frame.origin.y = -0.2*offset
            self.moviePoster.frame = frame
            return
        }
        
        offset = -1*offset
        // 0 to 100, transform 1 to 2
        let tx = (offset/500)+1
        self.moviePoster.transform = CGAffineTransformMakeScale(tx, tx)
    }
    
    
}
