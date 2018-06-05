//
//  ViewController.swift
//  AudioVideoDemo
//
//  Created by nikhil boriwale on 5/30/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import UIKit
import AVFoundation

import MobileCoreServices
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioPlayerDelegate {
     var audioPlayer: AVAudioPlayer? = AVAudioPlayer()
    
     let arrAudio: [String] = ["chime_bell_ding", "music_marimba_chord", "pop_drip"]
    
    let combinearray = [
        Movie(name: "movie1", director: "Michael "),
        Song(name: "Song1", artist: "Elvis"),
        Movie(name: "movie2", director: "Orson "),
        Song(name: "Song2", artist: "Chesney "),
        Song(name: "Song3", artist: "Rick ")
    ]

    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
    }
    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       var movieCount = 0
        var songCount = 0

        for item in combinearray {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }
       
    }

    // table method :
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return combinearray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: myTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! myTableViewCell)
        
        let item = combinearray[indexPath.row]
        
        if let  mySong  = item as? Song{
            
            cell .lblName.text = mySong.name
            cell.lblTitle.text = mySong.artist
            
        }else if let video = item as? Movie{
            
            cell .lblTitle.text = video.name
            cell.lblName.text = video.director
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    


}

