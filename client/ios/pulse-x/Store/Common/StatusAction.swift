//
//  StatusAction.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/23.
//

enum StatusAction<T>: Equatable where T: Equatable {
    case waiting
    case pending
    case success(T?)
    case failed(ErrorState)
}
