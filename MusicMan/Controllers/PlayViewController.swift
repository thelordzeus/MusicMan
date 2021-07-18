//
//  PlayViewController.swift
//  MusicMan
//
//  Created by Arnav Shukla on 17/07/21.
//

import UIKit
import AVFoundation
import Haptica

class PlayViewController: UIViewController {
    
    
    @IBOutlet var playingSongImage: UIImageView!
    @IBOutlet var playingSongLabel: UILabel!
    
    var selectedSong:SongLabel!=nil
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playingSongLabel.text = selectedSong.songName
        
        playingSongImage.image =  selectedSong.songImage
        playingSongImage.layer.cornerRadius = 10
        playingSongImage.layer.shadowOpacity = 0.5
        playingSongImage.layer.shadowRadius = 10
        
    }
    
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        
        Haptic.impact(.medium).generate()

        
        let songName = playingSongLabel.text
        
        switch songName {
        case "Blinding by the lights":
            let url = Bundle.main.url(forResource: "Blinding", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
        case "Hollywoods Bleeding":
            let url = Bundle.main.url(forResource: "Hollywood", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
        case "Life is a mess":
            let url = Bundle.main.url(forResource: "Life", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
        case "Bandit":
            let url = Bundle.main.url(forResource: "Bandit", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
        case "Counting Stars":
            let url = Bundle.main.url(forResource: "Counting", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
        case "Heartless":
            let url = Bundle.main.url(forResource: "Heartless", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
        case "The Hills":
            let url = Bundle.main.url(forResource: "Hills", withExtension: "mp3")
                   audioPlayer = try! AVAudioPlayer(contentsOf: url!)
                   audioPlayer.play()
            
            
        default:
            print("no song selected")
        }
        
     
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        Haptic.impact(.medium).generate()
        audioPlayer.pause()
    }
}
