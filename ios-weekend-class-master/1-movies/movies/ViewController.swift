//
//  ViewController.swift
//  movies
//
//  Created by Dan Kwon on 5/1/16.
//  Copyright © 2016 fullstack360. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func btnMoviesTapped(){
        print("btnMoviesTapped")
        
        let movieListVc = MovieListViewController()
        self.navigationController?.pushViewController(movieListVc, animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

