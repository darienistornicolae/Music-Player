//
//  EmptyStateView.swift
//  MusicPlayer
//
//  Created by Darie Nistor Nicolae on 29.11.2021.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            VStack {
                emptyLabelText
                messageText
            }
            Spacer()
            accessButton2
        }
        .padding(16)
        .multilineTextAlignment(.center)
    }
}

struct NoItems_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyStateView()
        }
    }
}

fileprivate extension EmptyStateView {
    private var emptyLabelText: some View {
        Text("Nothing to listen!")
            .font(.title)
            .fontWeight(.semibold)
            .padding(.vertical, 64)
    }
    
    private var messageText: some View {
        Text("Hey! I see you don't have any kind of songs here ☹️. Please, give me the permission to acces your folder and play some music for you 💙")
            .padding(.bottom, 20)
    }
    
    private var accessButton: some View {
        Button {
            print("Give me access tapped")
        } label: {
            Text("Give me acces 🙂")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .cornerRadius(20)
        }
    }
    
    private func customButtonFunc(title: String, onButtonTapped: @escaping (() -> Void)) -> some View {
        Button {
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {

               UIApplication.shared.open(settingsUrl)

             }
        } label: {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
        }
    }
    
    private var accessButton2: some View {
        customButtonFunc(title: "Give me acces 🙂") {
            print("access tapped")
        }
    }
    
}


struct PrimaryButton: View {
    let title: String
    let onButtonTapped: (() -> Void)
    
    var body: some View {
        Button {
            onButtonTapped()
        } label: {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
        }
    }
}
