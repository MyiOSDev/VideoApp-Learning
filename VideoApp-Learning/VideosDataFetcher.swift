//
//  VideosDataVM.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

import SwiftUI
internal import Combine

class VideosDataFetcher: ObservableObject {
    private let dbConnector = SupabaseConnector.activeInstance
    @Published var videosData: [VideosData] = []

    init() {
        dbConnector.connect()
    }

    func fetchData() async {
        do {
            videosData = try await dbConnector.getData(type: [VideosData].self) ?? []
            print(videosData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
