//
//  Environments.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

enum Environment {
    case Production
    case Development

    var config: Environmentable {
        switch self {
        case .Production:
            return ProductionEnvironment()
        case .Development:
            return DevelopmentEnvironment()
        }
    }
}
