//
//  ViewController.swift
//  day2
//
//  Created by Sarah Renshaw on 4/24/16.
//  Copyright © 2016 sartra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!

    var namesArray = Array<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

