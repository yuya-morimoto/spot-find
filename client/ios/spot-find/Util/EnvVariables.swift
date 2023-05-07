//
//  EnvVariables.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/05/04.
//

import Foundation

struct EnvVariables {
    static let zeusEndpoint = Bundle.main.object(forInfoDictionaryKey: "ZeusEndpoint") as! String
}
