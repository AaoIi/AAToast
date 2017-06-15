//
//  ViewController.swift
//  AAToast
//
//  Created by AaoIi on 1/4/16.
//  Copyright © 2016 Saad Albasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var toast:AAToast!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func shortToast(_ sender: AnyObject) {
        toast = AAToast(frame: self.view.frame, title: "No Internet Connection !!", duration: 3,type: .short)
        self.view.addSubview(toast)
    }
    
    @IBAction func longToast(_ sender: AnyObject) {
        
        toast = AAToast(frame: self.view.frame, title: "No Internet Connection !! Please try again later", duration: 3,type: .long)
        self.view.addSubview(toast)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

