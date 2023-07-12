//
//  AuthState.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/22.
//

import ComposableArchitecture
import FirebaseAuth
import SwiftUI

struct AuthState: Equatable {
    var currentUser: User?
    // メールアドレス認証後の検知用
    var isEmailVerified: Bool
    var createaUserApiStatus: CreateUserApiStatus = .init()
    var sendEmailVerificationApiStatus: SendEmailVerificationApiStatus = .init()
    var signInApiStatus: SignInApiStatus = .init()
    var signOutApiStatus: SignOutApiStatus = .init()

    init() {
        // メールアドレス認証済み情報を設定する
        if let user = Auth.auth().currentUser {
            self.currentUser = user
            self.isEmailVerified = user.isEmailVerified
        } else {
            self.currentUser = nil
            self.isEmailVerified = false
        }
    }
}


typealias CreateUserApiStatus = StatusState<AuthDataResult>
typealias SendEmailVerificationApiStatus = StatusState<Bool>
typealias SignInApiStatus = StatusState<AuthDataResult>
typealias SignOutApiStatus = StatusState<Bool>
