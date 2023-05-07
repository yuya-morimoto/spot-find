//
//  SignUpPage.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/23.
//

import ComposableArchitecture
import SwiftUI

struct SignUpPage: View {
    @State var email: String = ""
    @State var password: String = ""

    let viewStore: AppViewStore

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Create Account.")
                        .foregroundColor(.Primary)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("create with email.")
                        .foregroundColor(Color.gray.opacity(0.6))
                }
                Spacer()
            }.padding()
            Spacer()
            SignUpForm(viewStore: viewStore)
            Spacer()
        }
        .padding(30)
        .background(Color.BackgroundColor)
    }
}
