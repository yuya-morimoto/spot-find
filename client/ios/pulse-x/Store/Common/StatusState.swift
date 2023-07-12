//
//  StatusState.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/23.
//

import ComposableArchitecture
import FirebaseAuth
import SwiftUI

enum Status {
    case waiting
    case pending
    case success
    case failed
}

struct StatusState<T>: Equatable where T: Equatable {
    var status: Status = .waiting
    var result: T?
    var error: ErrorState?

    init() {
        self.status = .waiting
        self.result = nil
        self.error = nil
    }
}

extension StatusState {
    mutating func reset() {
        self.status = .waiting
        self.result = nil
        self.error = nil
    }

    mutating func stepWaiting() {
        self.status = .waiting
    }

    mutating func stepPending() {
        self.status = .pending
    }

    mutating func stepSuccess(result: T?) {
        self.status = .success
        self.result = result
        self.error = nil
    }

    mutating func stepFailed(error: ErrorState) {
        self.status = .failed
        self.result = nil
        self.error = error
    }
}
