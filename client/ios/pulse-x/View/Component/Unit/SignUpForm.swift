//
//  SignUpForm.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import ComposableArchitecture
import SwiftUI

struct SignUpForm: View {
    @State private var email: String = ""
    @State private var validEmailMessage: String? = nil
    @State private var password: String = ""
    @State private var validPasswordMessage: String? = nil

    let viewStore: AppViewStore

    var body: some View {
        VStack {
            // MARK: - email

            VStack(alignment: .leading) {
                Text("メールアドレス")
                    .foregroundColor(.ForegroundColor)
                    .font(.callout)
                ErrorText(errorText: self.validEmailMessage)
                TextField("example@pulse-x.jp", text: self.$email)
                    .foregroundColor(.ForegroundColor)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .font(.callout)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
            }

            // MARK: - password

            VStack(alignment: .leading) {
                Text("パスワード")
                    .foregroundColor(.ForegroundColor)
                    .font(.callout)
                ErrorText(errorText: self.validPasswordMessage)
                SecureField("8-16文字の半角英数字", text: self.$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.alphabet)
                    .font(.callout)
            }.padding(.top)

            // MARK: - submit

            VStack(alignment: .center) {
                Button(action: {
                    if self.validate() {
                        self.viewStore.send(.auth(.createUser(email: self.email, password: self.password)))
                    }
                }, label: {
                    Text("アカウントを作成")
                        .frame(maxWidth: .infinity)
                })
                .frame(maxWidth: .infinity)
                .buttonStyle(CapsuleButtonStyle(backgroundColor: signUpButtonBackgroundColor, foregroundColor: .PrimaryContrast))
                .disabled(signUpButtonDisabled)
                .padding(.top)
                ErrorText(errorText: self.viewStore.auth.createaUserApiStatus.error?.message)
            }
        }.onAppear {
            // APIステータスをリセットする
            self.viewStore.send(.auth(.resetCreateUser))
        }
    }
}

extension SignUpForm {
    var signUpButtonDisabled: Bool {
        return self.email == "" || self.password == ""
    }

    var signUpButtonBackgroundColor: Color {
        if self.signUpButtonDisabled {
            return .DisableColor
        }
        return .Primary
    }

    private func validate() -> Bool {
        self.resetValid()
        if let validEmailMessage = email.isValidEmailFormat {
            self.validEmailMessage = validEmailMessage
        }
        if let validPasswordMessage = password.isValidPasswordFormat {
            self.validPasswordMessage = validPasswordMessage
        }
        return self.validEmailMessage == nil && self.validPasswordMessage == nil
    }

    private func resetValid() {
        self.validEmailMessage = nil
        self.validPasswordMessage = nil
    }
}
