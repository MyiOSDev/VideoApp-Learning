//
//  HomeView.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 10/08/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var videoDataFetcher = VideosDataFetcher()

    var body: some View {
        List(videoDataFetcher.videosData ?? []) { videoData in
            Text(videoData.videoTitle)
        }.task {
            await self.videoDataFetcher.fetchData()
        }
    }
}

#Preview {
    HomeView()
}
