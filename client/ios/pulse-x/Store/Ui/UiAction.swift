//
//  UiAction.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import ComposableArchitecture

enum UiAction: Equatable {
    // MARK: - wait email verification

    case delayEmailVerificationStatus
    case delayEmailVerificationResponse(TaskResult<Bool>)
    case resetDelayEmailVerificationStatus
}
