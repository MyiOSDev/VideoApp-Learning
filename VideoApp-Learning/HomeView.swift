//
//  HomeView.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 10/08/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var videoDataFetcher = VideosDataFetcher()
    @State var isLoading: Bool = true

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.blue)
                Text("Loading...")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .bold()
            } else {
                List(videoDataFetcher.videosData) { videoData in
                    Text(videoData.videoTitle)
                }
            }
        }.task {
            await self.videoDataFetcher.fetchData()
            isLoading = false
        }
    }
}

#Preview {
    HomeView()
}
