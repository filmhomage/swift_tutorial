//
//  SWNetworkViewController.swift
//  swift_tutorial
//
//  Created by JonghyunKim on 5/18/16.
//  Copyright © 2016 kokaru.com. All rights reserved.
//

import UIKit
import RealmSwift

class SWNetworkViewController : UIViewController {
    
    @IBOutlet weak var textFieldSearch: UITextField!
    @IBOutlet weak var textViewResult: UITextView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadTracks();
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
                self.saveToTracks(itunesSearch.results)
                
                break
            case .Error(let error):
                print(error)
                break
            }
        }
    }
    
    

// FIXME: move to DAO
    
    func loadTracks() {
        
        let realm = try! Realm()
        let tracks = realm.objects(SWTrackModel).sorted("trackId", ascending: false)
        if(tracks.count > 0) {
            var resultString = ""
            for track in tracks {
                resultString = resultString + "[trackId : " + track.trackId + "] [artistName: " + track.artistName + "] [trackNam: " + track.trackName + "]\n\n"
            }
            self.textViewResult.text = resultString
        }
    }

    func saveToTracks(tracks :[Track]?) {
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(SWTrackModel))
        }
        
        realm.beginWrite()
        
        for track in tracks! {
            let trackModel = SWTrackModel();
            trackModel.trackId = track.trackId
            trackModel.trackName = track.trackName
            trackModel.artistName = track.artistName
            realm.add(trackModel)
        }
        try! realm.commitWrite();
    }
}
