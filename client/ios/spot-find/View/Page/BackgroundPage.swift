//
//  BackgroundPage.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/05/01.
//

import ComposableArchitecture
import SwiftUI

struct BackgroundPage: View {
    let store: AppStore

    var body: some View {
        WithViewStore(self.store) { viewStore in
            ProgressSpinnerObserve(viewStore: viewStore)
        }
    }
}
