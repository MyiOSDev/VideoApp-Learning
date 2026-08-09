//
//  VideosData.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

import Foundation

nonisolated struct VideosData: Codable, Identifiable, Sendable {
    var id: Int?
    let created_at: Date
    let videoTitle: String
    let videoDescription: String
    let videoLink: String
    let thumbnailLink: String
}
