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
    @State var isDataAvailable = false

    var body: some View {
        NavigationStack {
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
                        HStack {
                            VideoDataView().environmentObject(videoData)
                                .frame(width: 50, height: 50)
                            Spacer(minLength: 20)
                            NavigationLink(videoData.videoTitle) {
                                VideoPlayerView()
                                    .environmentObject(videoData)
                            }
                        }
                    }
                }
            }
            .onAppear(perform: {
                Task {
                    await self.videoDataFetcher.fetchData(shouldLoadVideosData: !isDataAvailable)
                    isLoading = false
                    isDataAvailable = true
                }
            })
            .navigationTitle("Videos")
        }
    }
}

#Preview {
    HomeView()
}
