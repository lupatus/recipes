//
//  VideoView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/22/24.
//
import SwiftUI
import YouTubePlayerKit

struct VideoView: View {
    let player: YouTubePlayer
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(url: URL) {
        player = YouTubePlayer(stringLiteral: url.absoluteString)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color
                .black
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            YouTubePlayerView(player)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.square.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
                    .shadow(color: .black, radius: 3)
            }
            .padding(.trailing, 8)
            .padding(.top, 8)
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    VideoView(url: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg")!)
}
