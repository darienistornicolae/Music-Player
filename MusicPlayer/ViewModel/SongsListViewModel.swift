//
//  SongsListViewModel.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import Foundation
import MediaPlayer

//var player: AVAudioPlayer!

class SongsListViewModel: ObservableObject {
    @Published var items: [SongModel] = []
    @Published var isLoading = false
    
    init() {
        MPMediaLibrary.requestAuthorization { status in
            switch status {
            case .notDetermined:
                return
            case .denied:
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {

                   UIApplication.shared.open(settingsUrl)

                 }
            case .restricted:
                return
            case .authorized:
                let querry = MPMediaQuery.songs()
                
                guard let songsFromQuerry = querry.items
                else {
                    return
                }
                 var songModelArray = [SongModel]()
                
                songsFromQuerry.forEach({songModelArray.append(SongModel(artistName: $0.artist ?? "Unknown Artist", songName: $0.title ?? "Unknown Song"))})
                
                DispatchQueue.main.async {
                    self.items = songModelArray
                    self.isLoading = false
                }
            @unknown default:
                return
            }
        }
    }
   
}
