//
//  VideosData.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

import Foundation
internal import Combine

nonisolated final class VideosData: Codable, Identifiable, Sendable, ObservableObject {
    let id: Int?
    let created_at: Date
    let videoTitle: String
    let videoDescription: String
    let videoLink: String
    let thumbnailLink: String

    init(id: Int?, created_at: Date, videoTitle: String, videoDescription: String, videoLink: String, thumbnailLink: String) {
        self.id = id
        self.created_at = created_at
        self.videoTitle = videoTitle
        self.videoDescription = videoDescription
        self.videoLink = videoLink
        self.thumbnailLink = thumbnailLink
    }
}
