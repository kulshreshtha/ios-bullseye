//
//  AboutViewController.swift
//  HelloWorld
//
//  Created by Kulshreshtha, Sachin on 17/01/19.
//  Copyright © 2019 Kulshreshtha, Sachin. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeMe(){
        self.dismiss(animated: true, completion: nil)
    }
}
