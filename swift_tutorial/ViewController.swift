//
//  ViewController.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/9/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.createButtons()
    }
    
    func createButtons() {
        
        let button = UIButton(type: UIButtonType.Custom)
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("Button", forState: UIControlState.Normal)
        button.frame = CGRectMake(100, 100, 200, 100)
        button.addTarget(self, action: #selector(ViewController.clickMe(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func clickMe(sender:UIButton?) {
        print("Button Clicked")
    }
}

