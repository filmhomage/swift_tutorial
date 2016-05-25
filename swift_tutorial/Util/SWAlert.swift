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
                                                        style: UIAlertActionStyle.Cancel,
                                                        handler:{
                                                            (action:UIAlertAction!) -> Void in
        })
        alertController.addAction(okAction)
        UIApplication.topViewController()!.presentViewController(alertController, animated: true) {
            print("UIAlertController presentation!")
        };
    }
    
    func showOkAlert(title: String = "title", message: String = "message", completion: (cancel: Bool) -> Void) {
        
        let alertController :UIAlertController = UIAlertController(title:title,
                                                                   message:message,
                                                                   preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "OK",
                                                    style: UIAlertActionStyle.Default,
                                                    handler:{
                                                        (action:UIAlertAction!) -> Void in
                                                        completion(cancel: false)
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "cancel",
                                                    style: UIAlertActionStyle.Cancel,
                                                    handler:{
                                                        (action:UIAlertAction!) -> Void in
                                                        completion(cancel:true)
        })
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        UIApplication.topViewController()!.presentViewController(alertController, animated: true) {
            print("UIAlertController presentation!")
        };
    }
}
