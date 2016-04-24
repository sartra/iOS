//
//  ViewController.swift
//  firstApp
//
//  Created by Sarah Renshaw on 4/17/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    var numTapped = 0
 
    var numTapped: Int!
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var homeTextField: UITextField!
    @IBOutlet var image: UIImageView!
    
    @IBAction func buttonTapped(){
        
        let textFieldValue = self.homeTextField.text
        if (textFieldValue?.characters.count > 0){
            self.homeLabel.text = textFieldValue
            return //stop
        }
        
        //COUNTING TAPS AND CHANGING COLORS BASED ON NUMBER OF TIMES BUTTON IS TAPPED
        self.numTapped = self.numTapped+1
        print("Button Tapped: \(self.numTapped)")
        
        var isEven = false
        if (self.numTapped % 2 == 0){
            isEven = true
            self.image.image = UIImage(named: "wework.png")
        }
        else{
            self.image.image = UIImage(named: "logo.png")
        }
        
        var multipleOfFive = false
        if (self.numTapped % 5 == 0){
            multipleOfFive = true
            self.image.image = UIImage(named: "apple.png")
        }

        
        
        var textColor = UIColor.yellowColor()
        if (isEven){
            textColor = UIColor.redColor()
        }
        if (multipleOfFive){
            textColor = UIColor.greenColor()
        }
        
        self.homeLabel.text = "Button Tapped: \(self.numTapped)"
        self.homeLabel.textColor = textColor
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numTapped = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

