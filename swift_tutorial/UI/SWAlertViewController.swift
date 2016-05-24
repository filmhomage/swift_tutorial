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
        print("showOKAlertButtonTapped")
        
        SWAlert.sharedInstance.showOkAlert()
    }
}
