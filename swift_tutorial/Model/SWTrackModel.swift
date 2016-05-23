//
//  SWTrackModel.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/23/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import Foundation

import RealmSwift

class SWTrackModel : Object {
    
//    static let realm = try! Realm()
    
    dynamic var trackName = ""
    dynamic var trackId = ""
    dynamic var artistName = ""
 
//    dynamic private var id = 0
//    override static func primaryKey() -> String? {
//        return "id"
//    }

//    static func loadAll() -> [SWTrackModel] {
//        
//        let tracks = realm.objects(SWTrackModel).sorted("id", ascending: false)
//        var ret: [SWTrackModel] = []
//        for track in tracks {
//            ret.append(track)
//        }
//        return ret
//    }
//
//    static func lastId() -> Int {
//        if let track = realm.objects(SWTrackModel).last {
//            return track.id + 1
//        } else {
//            return 1
//        }
//    }
    
    
}
