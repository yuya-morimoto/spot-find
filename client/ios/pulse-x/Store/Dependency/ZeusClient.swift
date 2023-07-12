//
//  ZeusClient.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/05/04.
//

import Foundation
import Apollo

import Dependencies
import FirebaseAuth


private enum ZeusClientKey: DependencyKey {
    public static let liveValue = ApolloClient(url: URL(string: EnvVariables.zeusEndpoint)!)
}

public extension DependencyValues {
    var zeusClient: ApolloClient {
        get { self[ZeusClientKey.self] }
        set { self[ZeusClientKey.self] = newValue }
    }
}


let apolloClient = ApolloClient(url: URL(string: "http://localhost:3000/graphql")!)
