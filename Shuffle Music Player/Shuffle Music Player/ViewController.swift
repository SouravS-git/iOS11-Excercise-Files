//
//  ViewController.swift
//  Shuffle Music Player
//
//  Created by Sourav Sarkar on 05/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var myMusicPlayer = AVAudioPlayer()
    let myMusics = ["broken-shovel", "cayuga-summer", "interlaken-crossroad", "lennys-song", "merluzzo", "oaklawn-dreams", "wingspan"]
    
    @IBOutlet weak var musicTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePlayer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func suffleMusic(_ sender: Any) {
        preparePlayer()
        myMusicPlayer.play()
    }
    
    @IBAction func pauseMusic(_ sender: Any) {
        myMusicPlayer.pause()
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        myMusicPlayer.stop()
    }
    
    func preparePlayer() {
        let randomNumber = arc4random_uniform(UInt32(myMusics.count))
        
        let selectedMusic = myMusics[Int(randomNumber)]
        
        musicTitle.text = selectedMusic
        
        let musicURL = URL(fileURLWithPath: Bundle.main.path(forResource: selectedMusic, ofType: "mp3")!)
        
        myMusicPlayer = try! AVAudioPlayer(contentsOf: musicURL)
        myMusicPlayer.prepareToPlay()
    }
}

