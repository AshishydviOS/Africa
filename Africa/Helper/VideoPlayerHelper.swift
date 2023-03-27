//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Ashish Yadav on 06/05/22.
//

import Foundation
import AVKit

var videoPlayer : AVPlayer?

func playVideo(fileName : String, fileExtension : String) -> AVPlayer {
    if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
        videoPlayer = AVPlayer(url: fileURL)
        videoPlayer?.play()
    }
    return videoPlayer!
}
