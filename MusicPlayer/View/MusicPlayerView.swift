//
//  MusicPlayerView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI
import MediaPlayer


struct MusicPlayerView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: MusicPlayerViewModel
    
    
    // MARK: - Init
    init(viewModel: MusicPlayerViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    
    // MARK: - Body
    var body: some View {
            VStack {
                Spacer()
                defaultImage
                Spacer()
                
                songName
                artistName
                    .padding(.bottom, 40)
                Spacer()
                
                ZStack {
                    controlSheet
                        .padding()
                    playButton
                    
                }
            }
            .navigationTitle("Playing now")
            .onAppear {
                viewModel.playMusic()
                //MPMusicPlayerController.systemMusicPlayer.play()
            }
    }
}


// MARK: - Previews
struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MusicPlayerView(viewModel: MusicPlayerViewModel(item: SongModel(artistName: "Kek", songName: "Top kek")))
        }
    }
}


// MARK: - Extracted Views
fileprivate extension MusicPlayerView {
    private var defaultImage: some View {
        Image("Test")
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .frame(maxWidth: 250, maxHeight: 350)
    }
    
    private var songName: some View {
        Text(viewModel.item.songName)
            .font(.title)
            .fontWeight(.semibold)
    }
    
    private var artistName: some View {
        Text(viewModel.item.artistName)
            .font(.title)
            .foregroundColor(.gray)
    }
    
    private var controlSheet: some View {
        RoundedRectangle(cornerRadius: 20)
            .edgesIgnoringSafeArea(.bottom)
            .frame(maxWidth: .infinity)
            .frame(height: .infinity)
            .foregroundColor(.accentColor)
            .shadow(color: Color.blue, radius: 21, x: 2, y: 0)
    }
    
    private var playButton: some View {
        Button {
            viewModel.play()
        } label: {
            Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.green)
                    
                )
        }
    }
}
