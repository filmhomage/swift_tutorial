//
//  SWUIViewController.swift
//  swift_tutorial
//
//  Created by earth on 5/11/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit

class SWUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func returnButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { 
            print("UI dismiss")
        }
    }
}
