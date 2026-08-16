//
//  StagedDataConnector.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 16/08/26.
//

import Foundation

enum StagedDataError: Error {
    case JSON_NOT_FOUND
    case JSON_DECODING
    
    func message() -> String {
        switch self {
        case .JSON_NOT_FOUND:
            return "JSON file not found"
        case .JSON_DECODING:
            return "JSON decoding failed"
        }
    }
}

class StagedDataConnector: DatabaseConnector {
    static var _instance = StagedDataConnector()
    
    static var activeInstance: DatabaseConnector {
        _instance
    }
    
    var environment: Environment = .Production
    
    private init() {}
    
    private func loadJson<T>(type: T.Type) throws -> T? where T : Decodable, T : Sendable {
        guard let url = Bundle.main.url(
            forResource: "StagedVideosData",
            withExtension: "json"
        ) else {
            print("VideosData.json not found")
            throw StagedDataError.JSON_NOT_FOUND
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(type.self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
            throw StagedDataError.JSON_DECODING
        }
    }
    
    func connect() {}   // No connection is required in this case
    
    func getData<T>(type: T.Type) async throws -> T? where T : Decodable, T : Sendable {
        try loadJson(type: type)
    }
}
