//
//  DevelopmentEnvironment.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

struct DevelopmentEnvironment: Environmentable {
    private let _baseUrl: String = "https://hvlzboczvxwktwprvkqi.supabase.co"
    private let _apiKey: String = "sb_publishable_sRVLp4dZy0s60S2iOOK89Q_XDyx2lNJ"
    var baseUrl: String {
        _baseUrl
    }
    var apiKey: String {
        _apiKey
    }
}
