//
//  SWAlertViewController.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/24/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit

class SWAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    @IBAction func showOKAlertButtonTapped(sender: UIButton) {
        SWAlert.sharedInstance.showOkAlert("title", message: "message")
    }
    
    @IBAction func showOKCancelAlert(sender: UIButton) {
        SWAlert.sharedInstance.showOKCancelAlert("title", message: "message") { (cancel) in
            print("showOkAlert close value : \(cancel)" )
        }
    }
    
    @IBAction func showMultipleAlertButtonTapped(sender: UIButton) {
        SWAlert.sharedInstance.showChooseAlert("Select Alert", message: "choose one", buttonTitleArray: ["button1", "button2", "button3"]) { (selectedButtonString) in
            print("showChooseAlert selected String : \(selectedButtonString)" )
        }
    }
    
    @IBAction func loginAlertButtonTapped(sender: UIButton) {
        SWAlert.sharedInstance.showLoginAlert("Login Alert", message: "") { (selectedButtonString) in
            
        }
    }
}
