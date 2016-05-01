Skip to content
This repository
Search
Pull requests
Issues
Gist
@sartra
Unwatch 1
Star 0
Fork 0 sartra/iOS
Code  Issues 0  Pull requests 0  Wiki  Pulse  Graphs  Settings
Branch: master Find file Copy pathiOS/day2/day2/day2/ViewController.swift
ad10900  29 minutes ago
@sartra sartra show names list in list view
1 contributor
RawBlameHistory     141 lines (103 sloc)  4.5 KB
//
//  ViewController.swift
//  day2
//
//  Created by Sarah Renshaw on 4/24/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {  // conforming to the 'delegate protocol'
    
    @IBOutlet var nameField: UITextField!
    
    var namesArray = Array<String>()
    
    @IBOutlet var imagesScroll: UIScrollView!
    
    @IBOutlet var pageContol: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        let action = #selector(ViewController.showListView(_:))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next",
                                                                 style: .Plain,
                                                                 target: self,
                                                                 action: action)
        
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
    
    
    func showListView(btn: UIBarButtonItem){
        
        let listView = ListViewController()   // this allows the other view (listViewController) to be accessible
        listView.namesArray = self.namesArray
        self.navigationController?.pushViewController(listView, animated:true)
        
        print("showListView: ")
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {  // control click on UIScrollViewDelegate up top
        
        let offset = scrollView.contentOffset.x
        
        
        //        print("scrollViewDidScroll: \(offset)")
        
        if (offset < 100){
            //            print("First Page")
            self.view.backgroundColor = UIColor.lightGrayColor()
            self.pageContol.currentPage = 0
        }
        else if (offset < 300){
            //            print("Second Page")
            self.view.backgroundColor = UIColor.redColor()
            self.pageContol.currentPage = 1
        }
        else {
            //            print("Third Page")
            self.view.backgroundColor = UIColor.yellowColor()
            self.pageContol.currentPage = 2
        }
    }
    
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){  // when the scrolling is ended
        let offset = scrollView.contentOffset.x
        print("scrollViewDidEndDecelerating: \(offset)")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool { // function has to return a boolean value T/F
        print("textFieldShouldReturn: ")
        textField.resignFirstResponder()  // make the keyboard disappear
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
        print("shouldChangeCharactersInRange: \(string)")
        
        if (string=="a"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if(string=="e"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if(string=="i"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if(string=="o"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else if(string=="u"){
            self.view.backgroundColor = UIColor.redColor()
        }
        else{
            self.view.backgroundColor = UIColor.lightGrayColor()
        }
        
        return true
        
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

Status API Training Shop Blog About
    © 2016 GitHub, Inc. Terms Privacy Security Contact Help