//
//  SWProgress.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class SWProgress : NSObject {
 
    static let sharedInstance = SWProgress()
    
    override init() {
        print("SWProgress init!")
    }
    
    func showProgress() {
        self.hideProgress()
        let hud = MBProgressHUD.showHUDAddedTo(UIApplication.topViewController()!.view, animated: true)
        hud.mode = MBProgressHUDMode.Indeterminate
        hud.color = colorOrange
        hud.alpha = 0.95
        hud.minSize = CGSize(width: 100.0, height:100.0)
    }
    
    func showProgress(labelText : String?) {
        self.hideProgress()
        let hud = MBProgressHUD.showHUDAddedTo(UIApplication.topViewController()!.view, animated: true)
        hud.mode = MBProgressHUDMode.Indeterminate
        hud.color = colorOrange
        hud.alpha = 0.95
        hud.minSize = CGSize(width: 100.0, height:100.0)
        hud.labelText = labelText
    }
    
    func showProgress(labelText: String?,
                      mode: MBProgressHUDMode = MBProgressHUDMode.Indeterminate,
                      alpha: CGFloat = 0.95,
                      color: UIColor = UIColor.redColor(),
                      backgroundColor: UIColor,
                      minsize: CGSize = CGSize(width: 100.0, height: 100.0)) {
        
        self.hideProgress()
        let hud = MBProgressHUD.showHUDAddedTo(UIApplication.topViewController()!.view, animated: true)
        hud.mode = mode
        hud.color = color
        hud.alpha = alpha
        hud.minSize = minsize
        hud.labelText = labelText
    }
    
    func hideProgress () {
        MBProgressHUD .hideHUDForView(UIApplication.topViewController()!.view, animated: true)
    }
}