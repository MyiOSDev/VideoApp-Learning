//
//  AppConfiguration.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 15/08/26.
//

struct AppConfiguration {
    static var useStagedData: Bool {
        CommandLine.arguments.contains("--use-staged-data")
    }
}
