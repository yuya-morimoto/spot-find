//
//  ProgressSpinnerObserve.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/05/01.
//

import ComposableArchitecture
import SwiftUI

struct ProgressSpinnerObserve: View {
    let viewStore: AppViewStore

    var body: some View {
        if isLoading() == true {
            ProgressSpinner()
        }
    }
}

extension ProgressSpinnerObserve {
    private func isLoading() -> Bool {
        if viewStore.ui.delayEmailVerificationStatus.status == .pending {
            return true
        } else {
            return false
        }
    }
}
