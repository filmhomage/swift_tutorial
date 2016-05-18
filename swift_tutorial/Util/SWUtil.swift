//
//  SWUtil.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit

class SWUtil : NSObject {
    
    static let sharedInstance = SWUtil()
    
    override init() {
        print("SWUtil init!")
    }
 
    // this function fail --> move to UIApplication Extension
//    func topPresentedViewController() -> UIViewController {
//        var resultVC : UIViewController?
//        if let topVC = UIApplication.sharedApplication().delegate?.window??.rootViewController {
//            while((topVC.presentedViewController) != nil) {
//                resultVC = topVC.presentedViewController
//            }
//        }
//        return resultVC!
//    }
    
}