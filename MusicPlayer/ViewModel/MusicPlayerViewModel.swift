//
//  MusicPlayerViewModel.swift
//  MusicPlayer
//
//  Created by Tudor Andreescu on 24.12.2021.
//

import Foundation
import AVKit


var player: AVAudioPlayer!

class MusicPlayerViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isPlaying: Bool
    let item: SongModel
    
    // MARK: - Init
    init(
        isPlaying: Bool = false,
        item: SongModel
    ) {
        self.isPlaying = isPlaying
        self.item = item
    }
        func playMusic() {
        let url = Bundle.main.url(forResource: "song", withExtension: "mp3")
        
        guard url != nil else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            
            
        }   catch {
            print("Error")
        }
    }
    
    func play() {
        if player.isPlaying {
            player.pause()
            self.isPlaying = false
            
        } else {
            player.play()
            self.isPlaying = true
        }
    }
    
    
}
