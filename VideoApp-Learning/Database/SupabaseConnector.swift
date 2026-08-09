//
//  SupabaseConnector.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

import Foundation
import Supabase

class SupabaseConnector: DatabaseConnector {
    private static var _instance = SupabaseConnector()
    private var _environment: Environment = .Production
    private var _client: SupabaseClient?

    static var activeInstance: DatabaseConnector {
        Self._instance
    }

    var environment: Environment {
        get {
            _environment
        }
        set {
            _environment = newValue
        }
    }

    private init() {}

    func connect() {
        let baseUrl = URL(string: _environment.config.baseUrl)
        guard let baseUrl else {
            print("Invalid Base URL!!!")
            return
        }
        _client = SupabaseClient(
            supabaseURL: baseUrl,
            supabaseKey: _environment.config.apiKey
        )
    }

    func getData<T: Decodable>(type: T.Type) async throws -> T? {
        do {
            let data: T? = try await _client?
                .from("VideoApp-Learning")
                .select()
                .execute()
                .value
            return data
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
