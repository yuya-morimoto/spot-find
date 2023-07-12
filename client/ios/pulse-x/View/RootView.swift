//
//  RootView.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/22.
//

import ComposableArchitecture
import FirebaseAuth
import SwiftUI

struct RootView: View {
    var store: AppStore = Store(initialState: AppReducer.State(), reducer: AppReducer())

    var body: some View {
        ZStack {
            WithViewStore(self.store) { viewStore in
                if let user = viewStore.auth.currentUser {
                    // メールアドレス認証状態を検知(新規登録時・再ログイン時・ログアウトから新規登録で動きが違う)
                    if user.isEmailVerified == true && viewStore.ui.isLoadedDelayEmailVerification {
                        AppTopPage(store: self.store)
                    } else {
                        WaitingEmailVerificationPage(viewStore: viewStore)
                    }
                } else {
                    SignTopPage(store: self.store)
                }
            }
            // バックグラウンドでステートの監視を行う
            BackgroundPage(store: self.store)
        }
    }
}
