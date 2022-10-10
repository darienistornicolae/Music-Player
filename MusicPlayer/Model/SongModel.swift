//
//  SongModel.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//
import AVKit
import Foundation

struct SongModel: Identifiable {
    let id: String
    let artistName: String
    let songName: String
    let storeID: String?
    
    
    init(id: String = UUID().uuidString, artistName: String, songName: String, storeID: String = " ") {
        self.id = id
        self.artistName = artistName
        self.songName = songName
        self.storeID = storeID
        
        
    }
}
