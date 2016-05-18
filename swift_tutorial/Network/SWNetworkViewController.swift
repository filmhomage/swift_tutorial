//
//  SWNetworkViewController.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit

class SWNetworkViewController : UIViewController {
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var textViewResult: UITextView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func searchButtonTapped(sender: AnyObject) {
        if let text = self.textFieldSearch.text {
            self.searchMusic(text)
        }
    }
    
    func searchMusic(term: String) {
        
        SWAPIManager<Results>().iTunesSearch(["term" : term, "country" : "jp"]) { (response) -> () in
            switch response {
            case .Success(let itunesSearch):
                
                var resultString = ""
                for result in itunesSearch.results! {
                    print(result.trackName)
                    resultString = resultString + "[trackId : " + result.trackId + "] [artistName: " + result.artistName + "] [trackNam: " + result.trackName + "]\n\n"
                }
                self.textViewResult.text = resultString
                break
            case .Error(let error):
                print(error)
                break
            }
        }
    }
}
