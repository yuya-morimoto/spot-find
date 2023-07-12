//
//  AuthAction.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/22.
//

import ComposableArchitecture
import FirebaseAuth

enum AuthAction: Equatable {
    // MARK: - current user

    case updateCurrentUser

    // MARK: - update current user

    case checkEmailVerification
    case onCheckEmailVerificationResponse(TaskResult<User?>)

    // MARK: - create user

    case createUser(email: String, password: String)
    case onCreateUserResponse(TaskResult<AuthDataResult>)
    case resetCreateUser

    // MARK: - send email verification

    case sendEmailVerification
    case onSendEmailVerificationResponse(TaskResult<Bool>)

    // MARK: - sign in

    case signIn(email: String, password: String)
    case onSignInResponse(TaskResult<AuthDataResult>)
    case resetSignIn

    // MARK: - sign out
    case signOut
    case onSignOutResponse(TaskResult<Bool>)
}
