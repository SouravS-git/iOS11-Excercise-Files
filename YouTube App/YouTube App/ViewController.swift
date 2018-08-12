//
//  ViewController.swift
//  YouTube App
//
//  Created by Sourav Sarkar on 04/08/18.
//  Copyright © 2018 Sourav Sarkar. All rights reserved.
//

import UIKit
import YouTubePlayer

class ViewController: UIViewController {
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    let videoID = "7gWMAxR6zts"
    let playlistID = "PLEbnTDJUr_IdcuTS8hvOqnvh-nDSoJbRT"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //videoPlayer.loadVideoID(videoID)
        videoPlayer.loadPlaylistID(playlistID)
    }

    @IBAction func playORpause(_ sender: UIButton) {
        if sender.isSelected {
            sender.setTitle("Pause", for: .selected)
            videoPlayer.pause()
        }else {
            sender.setTitle("Play", for: .normal)
            videoPlayer.play()
        }
    }
    
    @IBAction func playPrevious(_ sender: Any) {
        videoPlayer.previousVideo()
    }
    
    @IBAction func playNext(_ sender: Any) {
        videoPlayer.nextVideo()
    }
}

