//
//  SignInSheetToggleButton.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/29.
//

import ComposableArchitecture
import SwiftUI

struct SignInSheetToggleButton: View {
    @State var isShowingSheet: Bool = false
    var sheetPage: SignInPage

    var body: some View {
        Button(action: {
            isShowingSheet.toggle()
        }, label: {
            Text("ログインする")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(CapsuleButtonStyle(backgroundColor: .Primary, foregroundColor: .PrimaryContrast))
        .padding(.horizontal, 30)
        .sheet(isPresented: $isShowingSheet) {
            sheetPage
        }
    }
}
