//
//  VideoDataView.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 13/08/26.
//

import SwiftUI

struct VideoDataView: View {
    @EnvironmentObject var videoData: VideosData
    @State var isLoading = true
    @State var image: UIImage?

    var body: some View {
        HStack {
            if isLoading {
                ProgressView()
            } else {
                HStack {
                    if let image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
            }
            NavigationLink(videoData.videoTitle) {
                VideoPlayerView()
                    .environmentObject(videoData)
            }
            Spacer()
        }
        .padding(.leading, 4)
        .task {
            await loadImage()
        }
    }
    
    func loadImage() async {
        image = try? await ImageCacher.fetchImage(from: videoData.thumbnailLink)
        isLoading = false
    }
}

#Preview {
    VideoDataView()
        .environmentObject(VideosData(id: 1, created_at: Date(), videoTitle: "Hanuman Ji", videoDescription: "Hanuman Ji Mantra", videoLink: "https://hvlzboczvxwktwprvkqi.supabase.co/storage/v1/object/sign/VideoApp-Learning/Videos/HanumanjiMantra.mp4?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8xNWJkYWJjNS1mYmZmLTRkMjItODhiMi03NDEyYmUwOGQwZmYiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJWaWRlb0FwcC1MZWFybmluZy9WaWRlb3MvSGFudW1hbmppTWFudHJhLm1wNCIsInNjb3BlIjoiZG93bmxvYWQiLCJpYXQiOjE3ODYxMTg3MjIsImV4cCI6MjY1MDExODcyMn0.NrB1zLjr_lhbtpG88kLHVFy1R-upQWV80Mrhiqrut54", thumbnailLink: "https://hvlzboczvxwktwprvkqi.supabase.co/storage/v1/object/sign/VideoApp-Learning/Thumbnails/Hanumanji.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8xNWJkYWJjNS1mYmZmLTRkMjItODhiMi03NDEyYmUwOGQwZmYiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJWaWRlb0FwcC1MZWFybmluZy9UaHVtYm5haWxzL0hhbnVtYW5qaS5wbmciLCJzY29wZSI6ImRvd25sb2FkIiwiaWF0IjoxNzg2MTE4Nzg1LCJleHAiOjI2NTAxMTg3ODV9.vc2AjiDLZ_7UIlA8790NUFSmFqqPJMoWhKTdOzB4a_U"))
}
