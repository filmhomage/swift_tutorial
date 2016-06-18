//
//  SWSCLAlertViewController.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 6/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit
import SCLAlertView

class SWSCLAlertViewController: UIViewController {

    let kSuccessTitle = "Congratulations"
    let kErrorTitle = "Connection error"
    let kNoticeTitle = "Notice"
    let kWarningTitle = "Warning"
    let kInfoTitle = "Info"
    let kSubtitle = "You've just displayed this awesome Pop Up View"
    let kDefaultAnimationDuration = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            self.showSuccess("")
        })
    }
    
    @IBAction func showSuccess(sender: AnyObject) {
        
        let alert = SCLAlertView()
        alert.addButton("First Button", target:self, selector:#selector(SWSCLAlertViewController.firstButton))
        alert.addButton("Second Button") {
            print("Second button tapped")
        }
        
        let alertViewResponder: SCLAlertViewResponder =  alert.showSuccess(kSuccessTitle, subTitle: kSubtitle, animationStyle:SCLAnimationStyle.NoAnimation)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            alertViewResponder.close()
//            self.showError("")
        })
    }
    
    @IBAction func showError(sender: AnyObject) {
        let alertViewResponder: SCLAlertViewResponder =  SCLAlertView().showError("Hold On...", subTitle:"You have not saved your Submission yet. Please save the Submission before accessing the Responses list. Blah de blah de blah, blah. Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.Blah de blah de blah, blah.", closeButtonTitle:"OK", animationStyle:SCLAnimationStyle.TopToBottom)

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            alertViewResponder.close()
//            self.showNotice("")
        })
    }
    
    @IBAction func showNotice(sender: AnyObject) {
        let alertViewResponder: SCLAlertViewResponder =  SCLAlertView().showNotice(kNoticeTitle, subTitle: kSubtitle, animationStyle:SCLAnimationStyle.BottomToTop)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            alertViewResponder.close()
//            self.showWarning("")
        })
    }
    
    @IBAction func showWarning(sender: AnyObject) {
        let alertViewResponder: SCLAlertViewResponder =  SCLAlertView().showWarning(kWarningTitle, subTitle: kSubtitle, animationStyle:SCLAnimationStyle.LeftToRight)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            alertViewResponder.close()
//            self.showInfo("")
        })
        
    }
    
    @IBAction func showInfo(sender: AnyObject) {
        let alertViewResponder: SCLAlertViewResponder =  SCLAlertView().showInfo(kInfoTitle, subTitle: kSubtitle, animationStyle:SCLAnimationStyle.RightToLeft)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            alertViewResponder.close()
        })
    }
    
    @IBAction func showEdit(sender: AnyObject) {
        let appearance = SCLAlertView.SCLAppearance(showCloseButton: true)
        let alert = SCLAlertView(appearance: appearance)
        let txt = alert.addTextField("Enter your name")
        alert.addButton("Show Name") {
            print("Text value: \(txt.text)")
        }
        alert.showEdit(kInfoTitle, subTitle:kSubtitle)
    }
    
    @IBAction func showCustomSubview(sender: AnyObject) {
        // Create custom Appearance Configuration
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: true
        )
        
        // Initialize SCLAlertView using custom Appearance
        let alert = SCLAlertView(appearance: appearance)
        
        // Creat the subview
        let subview = UIView(frame: CGRectMake(0,0,216,70))
        let x = (subview.frame.width - 180) / 2
        
        // Add textfield 1
        let textfield1 = UITextField(frame: CGRectMake(x,10,180,25))
        textfield1.layer.borderColor = UIColor.greenColor().CGColor
        textfield1.layer.borderWidth = 1.5
        textfield1.layer.cornerRadius = 5
        textfield1.placeholder = "Username"
        textfield1.textAlignment = NSTextAlignment.Center
        subview.addSubview(textfield1)
        
        // Add textfield 2
        let textfield2 = UITextField(frame: CGRectMake(x,textfield1.frame.maxY + 10,180,25))
        textfield2.secureTextEntry = true
        textfield2.layer.borderColor = UIColor.blueColor().CGColor
        textfield2.layer.borderWidth = 1.5
        textfield2.layer.cornerRadius = 5
        textfield1.layer.borderColor = UIColor.blueColor().CGColor
        textfield2.placeholder = "Password"
        textfield2.textAlignment = NSTextAlignment.Center
        subview.addSubview(textfield2)
        
        // Add the subview to the alert's UI property
        alert.customSubview = subview
        alert.addButton("Login") {
            print("Logged in")
        }
        
        // Add Button with Duration Status and custom Colors
        alert.addButton("Duration Button", backgroundColor: UIColor.brownColor(), textColor: UIColor.yellowColor(), showDurationStatus: true) {
            print("Duration Button tapped")
        }
        
        alert.showInfo("Login", subTitle: "", duration: 10)
    }
    
    func firstButton() {
        print("First button tapped")
    }
}
