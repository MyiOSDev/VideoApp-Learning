//
//  VideosDataVM.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

import SwiftUI

class VideosDataFetcher {
    private let dbConnector = SupabaseConnector.activeInstance
    var videosData: [VideosData]?

    init() {
        dbConnector.connect()
    }

    func fetchData() async {
        do {
            videosData = try await dbConnector.getData(type: [VideosData].self)
        } catch {
            print(error.localizedDescription)
        }
    }
}
