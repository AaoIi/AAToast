//
//  ViewController.swift
//  AAToastExample
//
//  Created by Mobile build server on 8/1/19.
//  Copyright © 2019 Saad Albasha. All rights reserved.
//

import UIKit
import AAToast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shortToast(_ sender: AnyObject) {
        AAToast(toView: self.view, title: "No Internet Connection !!", duration: 2).show()
        
    }
    
    @IBAction func longToast(_ sender: AnyObject) {
        
        AAToast(toView: self.view, title: "No Internet Connection !! Please try again later No Internet Connection", duration: 2,textColor: .white,backgroundColor: .black,font: UIFont.systemFont(ofSize: 18)).show()
        
    }


}

