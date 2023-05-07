//
//  UiReducer.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import ComposableArchitecture

struct UiReducer: ReducerProtocol {
    @Dependency(\.timeClient.delay) var delay

    func reduce(into state: inout UiState, action: UiAction) -> EffectTask<UiAction> {
        switch action {
        case .delayEmailVerificationStatus:
            state.delayEmailVerificationStatus.stepPending()
            return .task {
                .delayEmailVerificationResponse(
                    await TaskResult {
                        try await delay(2000)
                    }
                )
            }
        case .delayEmailVerificationResponse(.success):
            state.isLoadedDelayEmailVerification = true
            state.delayEmailVerificationStatus.stepSuccess(result: true)
            return .none
        case .delayEmailVerificationResponse(.failure):
            state.isLoadedDelayEmailVerification = false
            state.delayEmailVerificationStatus.stepFailed(error: ErrorState.error)
            return .none
        case .resetDelayEmailVerificationStatus:
            state.isLoadedDelayEmailVerification = false
            state.delayEmailVerificationStatus.stepWaiting()
            return .none
        }
    }
}
