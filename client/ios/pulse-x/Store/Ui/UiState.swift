//
//  UiState.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import FirebaseAuth

struct UiState: Equatable {
    var isLoadedDelayEmailVerification: Bool
    var delayEmailVerificationStatus: DelayEmailVerificationStatus = .init()

    init() {
        // 既にメールアドレス認証済みの場合はtrue
        if let user = Auth.auth().currentUser {
            self.isLoadedDelayEmailVerification = user.isEmailVerified
        } else {
            self.isLoadedDelayEmailVerification = false
        }
    }
}

typealias DelayEmailVerificationStatus = StatusState<Bool>
