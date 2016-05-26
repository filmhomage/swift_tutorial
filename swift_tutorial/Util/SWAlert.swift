//
//  SWAlert.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/24/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import Foundation
import UIKit

class SWAlert : NSObject {
    
    static let sharedInstance = SWAlert()
    
    override init() {
        print("SWAlert init!")
    }
    
    func showOkAlert(title: String = "title", message: String = "message") {
    
        let alertController :UIAlertController = UIAlertController(title:title,
                                                        message:message,
                                                        preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "OK",
                                                        style: .Cancel,
                                                        handler:{(action:UIAlertAction!) -> Void in
        })
        alertController.addAction(okAction)
        UIApplication.topViewController()!.presentViewController(alertController, animated: true) {
            print("UIAlertController presentation!")
        }
    }
    
    func showOKCancelAlert(title: String = "title", message: String = "message", completion: (cancel: Bool) -> Void) {
        
        let alertController :UIAlertController = UIAlertController(title:title,
                                                                   message:message,
                                                                   preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "OK",
                                                    style: .Default,
                                                    handler:{
                                                        (action:UIAlertAction!) -> Void in
                                                        completion(cancel: false)
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "cancel",
                                                    style: .Cancel,
                                                    handler:{(action:UIAlertAction!) -> Void in
                                                        completion(cancel:true)
        })
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        UIApplication.topViewController()!.presentViewController(alertController, animated: true) {
            print("UIAlertController presentation!")
        }
    }
    
    
    func showChooseAlert(title: String = "title", message: String = "message", buttonTitleArray:[String?] = ["one", "two"], completion: (completion: String) -> Void) {
        
        let alertController :UIAlertController = UIAlertController(title:title,
                                                                   message:message,
                                                                   preferredStyle: UIAlertControllerStyle.Alert)
        
        for buttonTitle in buttonTitleArray {
            if buttonTitle != nil {
                let action = UIAlertAction(title: buttonTitle,
                                           style: .Default,
                                           handler:{(action:UIAlertAction!) -> Void in
                                            completion(completion: buttonTitle!)
                    })
                alertController.addAction(action)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Cancel,
                                         handler:{ (action:UIAlertAction!) -> Void in
                                            completion(completion: "Cancel")
        })
        
        alertController.addAction(cancelAction)
        
        UIApplication.topViewController()!.presentViewController(alertController, animated: true) {
            print("UIAlertController presentation!")
        }
    }
    
    func showLoginAlert(title: String = "title", message: String = "message", completion:(completion: String) -> Void) {
        
        let alertController :UIAlertController = UIAlertController(title:title,
                                                                   message:message,
                                                                   preferredStyle: UIAlertControllerStyle.Alert)
        
        let loginAction = UIAlertAction(title: "Login", style: .Default) { (_) in
            let loginTextField = alertController.textFields![0] as UITextField
            let passwordTextField = alertController.textFields![1] as UITextField
            
            print("id : \(loginTextField.text)  password : \(passwordTextField.text)")
//            login(loginTextField.text, passwordTextField.text)
        }
        loginAction.enabled = false
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .Destructive) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Login"
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue: NSOperationQueue.mainQueue()) { (notification) in
                loginAction.enabled = textField.text != ""
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(forgotPasswordAction)
        alertController.addAction(cancelAction)
        
        UIApplication.topViewController()!.presentViewController(alertController, animated: true) {
            print("UIAlertController presentation!")
        }
    }
    
}
