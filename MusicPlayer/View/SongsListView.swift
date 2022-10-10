//
//  SongsListView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI

struct SongsListView: View {
    @StateObject var viewModel: SongsListViewModel
    
    init(viewModel: SongsListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        if viewModel.items.isEmpty {
            EmptyStateView()
        } else {
            NavigationView {
                List {
                    ForEach(viewModel.items) { song in
                        NavigationLink(destination: MusicPlayerView(viewModel: MusicPlayerViewModel(item: song))) {
                            SongListRowView(song: song)
                        }
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Music Player")
            }
        }
    }
}

struct PlayerView_List_Previews: PreviewProvider {
    static var previews: some View {
        SongsListView(viewModel: SongsListViewModel())
    }
}
