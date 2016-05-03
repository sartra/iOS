//
//  ViewController.swift
//  movies
//
//  Created by Sarah Renshaw on 5/1/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func btnMoviesTapped(){
        print("btnMoviesTapped")
        
        let movieVc = MovieListViewController()
        self.navigationController?.pushViewController(movieVc, animated: true)
    }
    
    @IBAction func btnBandsTapped(){
        print("btnBandsTapped")
        
        let bandsVc = BandsViewController()
        self.navigationController?.pushViewController(bandsVc, animated: true)
        
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

