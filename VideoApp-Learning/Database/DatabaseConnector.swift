//
//  Connection.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

protocol DatabaseConnector {
    static var activeInstance: DatabaseConnector { get }
    var environment: Environment { get set }

    func connect()
    func getData<T: Decodable & Sendable>(type: T.Type) async throws -> T?
}
