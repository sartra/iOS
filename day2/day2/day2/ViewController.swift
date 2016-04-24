//
//  ViewController.swift
//  day2
//
//  Created by Sarah Renshaw on 4/24/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {  // conforming to the 'delegate protocol'
    
    @IBOutlet var nameField: UITextField!

    var namesArray = Array<String>()
    
    @IBOutlet var imagesScroll: UIScrollView!
    
    @IBOutlet var pageContol: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstSlide.backgroundColor = UIColor.blueColor()
        self.imagesScroll.addSubview(firstSlide)
        
        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondSlide.backgroundColor = UIColor.greenColor()
        self.imagesScroll.addSubview(secondSlide)
        
        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        thirdSlide.backgroundColor = UIColor.orangeColor()
        self.imagesScroll.addSubview(thirdSlide)
        
        self.imagesScroll.contentSize = CGSize(width: 600, height: 0)
        self.imagesScroll.delegate = self
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {  // control click on UIScrollViewDelegate up top
        
        let offset = scrollView.contentOffset.x
        
        
//        print("scrollViewDidScroll: \(offset)")
        
        if (offset < 100){
            print("First Page")
            self.view.backgroundColor = UIColor.lightGrayColor()
            self.pageContol.currentPage = 0
        }
        else if (offset < 300){
            print("Second Page")
            self.view.backgroundColor = UIColor.redColor()
            self.pageContol.currentPage = 1
        }
        else {
            print("Third Page")
            self.view.backgroundColor = UIColor.yellowColor()
            self.pageContol.currentPage = 2
        }
    }

    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){  // when the scrolling is ended
        let offset = scrollView.contentOffset.x
        print("scrollViewDidEndDecelerating: \(offset)")
        
    
    }

    
    @IBAction func addName(){
        
        let name = self.nameField.text
        if (name?.characters.count == 0){
            return // nothing entered so ignore input
        }
        self.namesArray.append(name!)
        self.nameField.text = "" //clear text field
        print("addName: \(self.namesArray)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

