//
//  SWAPIManager.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Alamofire

enum Result<T> {
    case Success(T)
    case Error(NSError)
}

class SWAPIManager<T> {
 
    func iTunesSearch(params : [String: AnyObject], completionHandler: (Result<T>) -> () = {_ in}) {
        
        SWProgress.sharedInstance.showProgress()
        
        Alamofire.request(Router.API_SEARCH(params))
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    if let resp = Mapper<Results>().map(response.result.value) {
                        completionHandler(Result<T>.Success((resp as? T)!))
                    }
                case .Failure(let error):
                    completionHandler(Result<T>.Error(error))
                }
                SWProgress.sharedInstance.hideProgress()
        }
    }
}

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://itunes.apple.com"
    
    case API_SEARCH([String: AnyObject])
    
    var URLRequest: NSMutableURLRequest {
        
        let (method, path, parameters) : (String, String, [String: AnyObject]) = {
            switch self {
            case .API_SEARCH(let params):
                return ("GET", "/search", params)
            }
        }()
        
        let URL = NSURL(string: Router.baseURLString)
        let URLRequest = NSMutableURLRequest(URL: URL!.URLByAppendingPathComponent(path))
        URLRequest.HTTPMethod = method
        let encoding = Alamofire.ParameterEncoding.URL
        return encoding.encode(URLRequest, parameters: parameters).0
    }
}

