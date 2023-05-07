//
//  SignInPage.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/23.
//

import ComposableArchitecture
import SwiftUI

struct SignInPage: View {
    @State var email: String = ""
    @State var password: String = ""

    let viewStore: AppViewStore

    var signUpButtonBgColor: Color {
        if email == "" || password == "" {
            return Color.DisableColor
        }
        return Color.Primary
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Welcome Back!")
                        .foregroundColor(Color.Primary)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("login with email.")
                        .foregroundColor(Color.gray.opacity(0.6))
                }
                Spacer()
            }.padding()
            Spacer()
            SignInForm(viewStore: viewStore)
            Spacer()
        }
        .padding(30)
        .background(Color.BackgroundColor)
    }
}
