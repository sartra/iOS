//
//  SlideViewController.swift
//  firstApp
//
//  Created by Sarah Renshaw on 4/17/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit


class SlideViewController: UIViewController {

    @IBOutlet var slideView: UIScrollView!
    var label: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideView.contentSize = CGSize(width: 600, height: 200)
        self.slideView.pagingEnabled = true
        
        
        let firstImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        firstImage.backgroundColor = UIColor.yellowColor()
        firstImage.image = UIImage(named: "logo.png")
        self.slideView.addSubview(firstImage)
        
        let secondImage = UIImageView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
        secondImage.backgroundColor = UIColor.yellowColor()
        secondImage.image = UIImage(named: "apple.png")
        self.slideView.addSubview(secondImage)
        
        let thirdImage = UIImageView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
        thirdImage.backgroundColor = UIColor.yellowColor()
        thirdImage.image = UIImage(named: "wework.png")
        self.slideView.addSubview(thirdImage)
        
        var y = self.slideView.frame.origin.y + self.slideView.frame.size.height+30
        let x = CGFloat(20)
        
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setTitle("Tap Me!", forState: .Normal)
        btn.frame = CGRect(x: x, y: y, width: self.view.frame.size.width-2*x, height: 44)
        btn.backgroundColor = UIColor.greenColor()
//        btn.addTarget(self, action: #selector(SlideViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        btn.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        y += btn.frame.size.height+30
        
        self.label = UILabel(frame: CGRect(x: x, y: y, width: self.view.frame.size.width-2*x, height: 22))
//        label.backgroundColor = UIColor.redColor()
        label.textColor = UIColor.darkGrayColor()
        label.text = "Hello"
        label.textAlignment = .Center
        self.view.addSubview(label)
        
        
        //        self.slideView.addSubview(firstSlide)
    
//        let firstSlide = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        firstSlide.backgroundColor = UIColor.yellowColor()
//        self.slideView.addSubview(firstSlide)
//        
//        let secondSlide = UIView(frame: CGRect(x: 200, y: 0, width: 200, height: 200))
//        secondSlide.backgroundColor = UIColor.blueColor()
//        self.slideView.addSubview(secondSlide)
//        
//        let thirdSlide = UIView(frame: CGRect(x: 400, y: 0, width: 200, height: 200))
//        thirdSlide.backgroundColor = UIColor.redColor()
//        self.slideView.addSubview(thirdSlide)

        // Do any additional setup after loading the view.
    }
    
    func buttonTapped(btn: UIButton){
        let offset = self.slideView.contentOffset.x
        print("button tapped: \(offset)")
        self.label.text = "TEST"

        if (offset == 0){
            self.label.text = "Image 1"
        }

        if (offset == 200){
            self.label.text = "Image 2"
        }
        
        if (offset == 400){
            self.label.text = "Image 3"
        }
        
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
