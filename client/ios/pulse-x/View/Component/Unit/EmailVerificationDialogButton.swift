//
//  EmailVerificationDialogButton.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/05/01.
//

import SwiftUI

struct EmailVerificationDialogButton: View {
    @State var isConfirming: Bool = false
    let viewStore: AppViewStore

    var body: some View {
        Button(action: {
            isConfirming = true
        }, label: {
            Text("メール再送・その他")
                .frame(maxWidth: .infinity)
        })
        .frame(maxWidth: .infinity)
        .buttonStyle(CapsuleButtonStyle(backgroundColor: .Primary, foregroundColor: .PrimaryContrast))
        .padding(.top)
        .confirmationDialog(
            "",
            isPresented: $isConfirming,
            titleVisibility: .hidden
        ) {
            Button {
                viewStore.send(.auth(.sendEmailVerification))
            } label: {
                Text("メールを再送する")
            }
            Button {
                viewStore.send(.auth(.signOut))
            } label: {
                Text("ログイン画面へ戻る")
            }
            Button {
                print("question!!!")
            } label: {
                Text("お問い合わせ")
            }
            Button("Cancel", role: .cancel) {
                isConfirming = false
            }
        }
    }
}
