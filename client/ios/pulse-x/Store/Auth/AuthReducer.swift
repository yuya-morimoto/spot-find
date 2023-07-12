//
//  AuthReducer.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/22.
//

import ComposableArchitecture
import FirebaseAuth

struct AuthReducer: ReducerProtocol {
    @Dependency(\.authClient.createUser) var createUser
    @Dependency(\.authClient.latestCurrentUser) var latestCurrentUser
    @Dependency(\.authClient.currentUser) var currentUser
    @Dependency(\.authClient.sendEmailVerification) var sendEmailVerification
    @Dependency(\.authClient.signIn) var signIn
    @Dependency(\.authClient.signOut) var signOut
    @Dependency(\.timeClient.delay) var delay

    func reduce(into state: inout AuthState, action: AuthAction) -> EffectTask<AuthAction> {
        switch action {
            // MARK: - update current user

        case .updateCurrentUser:
            state.currentUser = currentUser()
            return .none

            // MARK: - email verification

        case .checkEmailVerification:
            return .task {
                .onCheckEmailVerificationResponse(
                    await TaskResult {
                        try await latestCurrentUser()
                    })
            }
        case let .onCheckEmailVerificationResponse(.success(result)):
            if let user = result {
                state.isEmailVerified = user.isEmailVerified
            }
            return .none
        case .onCheckEmailVerificationResponse(.failure):
            return .none

            // MARK: - create user

        case let .createUser(email, password):
            state.createaUserApiStatus.stepPending()
            return .task {
                .onCreateUserResponse(
                    await TaskResult {
                        try await createUser(email, password)
                    }
                )
            }
        case let .onCreateUserResponse(.success(result)):
            state.currentUser = currentUser()
            state.createaUserApiStatus.stepSuccess(result: result)
            return .task(operation: { .sendEmailVerification })
        case let .onCreateUserResponse(.failure(error)):
            let error = error as NSError
            state.createaUserApiStatus.stepFailed(error: ErrorState.codeToErrorState(code: error.code))
            return .none
        case .resetCreateUser:
            state.createaUserApiStatus.reset()
            return .none

            // MARK: - send email verification

        case .sendEmailVerification:
            state.sendEmailVerificationApiStatus.stepPending()
            return .task {
                .onSendEmailVerificationResponse(
                    await TaskResult {
                        try await sendEmailVerification()
                    })
            }
        case let .onSendEmailVerificationResponse(.success(result)):
            state.sendEmailVerificationApiStatus.stepSuccess(result: result)
            return .none
        case let .onSendEmailVerificationResponse(.failure(error)):
            let error = error as NSError
            state.sendEmailVerificationApiStatus.stepFailed(error: ErrorState.codeToErrorState(code: error.code))
            return .none

            // MARK: - sign in

        case let .signIn(email, password):
            state.signOutApiStatus.stepPending()
            return .task {
                .onSignInResponse(
                    await TaskResult {
                        try await signIn(email, password)
                    })
            }
        case let .onSignInResponse(.success(result)):
            state.currentUser = currentUser()
            state.signInApiStatus.stepSuccess(result: result)
            return .none
        case let .onSignInResponse(.failure(error)):
            let error = error as NSError
            state.signInApiStatus.stepFailed(error: ErrorState.codeToErrorState(code: error.code))
            return .none
        case .resetSignIn:
            state.signInApiStatus.reset()
            return .none

            // MARK: - sign out

        case .signOut:
            state.signOutApiStatus.stepPending()
            return .task {
                .onSignOutResponse(
                    await TaskResult {
                        try await signOut()
                    })
            }
        case let .onSignOutResponse(.success(result)):
            state.currentUser = nil
            state.isEmailVerified = false
            state.signOutApiStatus.stepSuccess(result: result)
            return .none
        case let .onSignOutResponse(.failure(error)):
            let error = error as NSError
            state.signOutApiStatus.stepFailed(error: ErrorState.codeToErrorState(code: error.code))
            return .none
        }
    }
}
