//
//  SWButton.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/11/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit

class SWButtonViewController : UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.createButtons()
    }
    
    func createButtons() {
        
        let button = UIButton(type: UIButtonType.Custom)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("Button", forState: UIControlState.Normal)
        button.frame = CGRectMake(100, 100, 200, 100)
        
        button.addTarget(self, action: #selector(self.buttonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func buttonTapped(sender:UIButton?) {
        SWAlert.sharedInstance.showOkAlert("button tapped")
    }
    
    @IBAction func returnButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { 
            print("Button dismiss")
            
        }
    }
}

