import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @EnvironmentObject var videoData: VideosData

    var body: some View {
        let player = AVPlayer(url: URL(string: videoData.videoLink)!)
        NavigationStack {
            VStack {
                VideoPlayer(player: player)
                    .frame(height: 250)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
                    .padding(8)
                    .navigationTitle(videoData.videoTitle)
                HStack {
                    Text(videoData.videoDescription)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 8)
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    VideoPlayerView().environmentObject(VideosData(id: 1, created_at: Date(), videoTitle: "Hanuman Ji", videoDescription: "Hanuman Ji Mantra", videoLink: "https://hvlzboczvxwktwprvkqi.supabase.co/storage/v1/object/sign/VideoApp-Learning/Videos/HanumanjiMantra.mp4?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV8xNWJkYWJjNS1mYmZmLTRkMjItODhiMi03NDEyYmUwOGQwZmYiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJWaWRlb0FwcC1MZWFybmluZy9WaWRlb3MvSGFudW1hbmppTWFudHJhLm1wNCIsInNjb3BlIjoiZG93bmxvYWQiLCJpYXQiOjE3ODYxMTg3MjIsImV4cCI6MjY1MDExODcyMn0.NrB1zLjr_lhbtpG88kLHVFy1R-upQWV80Mrhiqrut54", thumbnailLink: ""))
}
