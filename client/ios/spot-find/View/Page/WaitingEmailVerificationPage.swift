//
//  WaitingEmailVerificationPage.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/29.
//

import ComposableArchitecture
import SwiftUI

struct WaitingEmailVerificationPage: View {
    var viewStore: AppViewStore

    @State var showActionSheet: Bool = false
    // 認証状態検証用タイマ
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    init(viewStore: AppViewStore) {
        self.viewStore = viewStore
        self.viewStore.send(.auth(.checkEmailVerification))
    }

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(Image.SentEmailIcon)
                .resizable()
                .frame(width: 200, height: 170)
            if let user = viewStore.auth.currentUser {
                if let email = user.email {
                    EmphasisText(text: email)
                    Text("上記のメールアドレスに届くメール本文内のURLをクリックして認証を完了させてください。認証完了後自動でアプリ画面へ遷移します。")
                        .font(.custom("message", size: 14))
                } else {
                    Text("登録いただいたメールアドレスに届くメール本文内のURLをクリックして認証を完了させてください。")
                        .font(.custom("message", size: 14))
                }
            } else {
                Text("登録いただいたメールアドレスに届くメール本文内のURLをクリックして認証を完了させてください。")
                    .font(.custom("message", size: 14))
            }
            EmailVerificationDialogButton(viewStore: viewStore)
            Spacer()
        }
        .padding(30)
        .background(Color.BackgroundColor)
        .onAppear() {
            viewStore.send(.ui(.resetDelayEmailVerificationStatus))
        }
        .onReceive(timer) { _ in
            if viewStore.ui.isLoadedDelayEmailVerification == true {
                timer.upstream.connect().cancel()
            } else if viewStore.auth.isEmailVerified == true {
                viewStore.send(.ui(.delayEmailVerificationStatus))
            } else {
                viewStore.send(.auth(.checkEmailVerification))
            }
        }
    }
}
