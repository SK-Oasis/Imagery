//
//  ContentView.swift
//  Imagery
//
//  Created by Jun on 2023/09/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager.shared
    
    @State private var isLoading = false
    var body: some View {
        ZStack {
            Color.OasisColors.darkGreen
                .ignoresSafeArea()
            
            switch gameManager.gameState {
            case .initial:
                StartView()
            case .ownStory:
                OwnStoryView()
            case .randomStory:
                RandomStoryView()
            case .playing, .result:
                GameView()
            case .storyHistory:
                HistoryView()
            case .inIllustCollection:
                InAlbumView()
            case .allIllustCollection:
                OverallAlbumView()
            }
        }
        .onAppear {
            if DataManager.shared.randomSubject == "로딩 중..." {
                Task {
                    await DataManager.shared.getSubject()
                }
            }
            HapticManager.shared.prepareHaptics()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
