//
//  APIResult.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import Foundation
import ObjectMapper

struct Results: Mappable {
    
    var resultCount = 0
    var results: [Track]?
    
    init?(_ map: Map){}
    
    mutating func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results     <- map["results"]
    }
}

struct Track: Mappable {
    var trackName = ""
    var trackId = ""
    var artistName = ""
    
    init?(_ map: Map){}
    
    mutating func mapping(map: Map) {
        trackId     <- map["trackId"]
        trackName   <- map["trackName"]
        artistName  <- map["artistName"]
    }
}