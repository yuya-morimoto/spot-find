//
//  SignUpSheetToggleButton.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import ComposableArchitecture
import SwiftUI

struct SignUpSheetToggleButton: View {
    @State var isShowingSheet: Bool = false
    var sheetPage: SignUpPage

    var body: some View {
        Button(action: {
            isShowingSheet.toggle()
        }, label: {
            Text("アカウントを作成する")
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(CapsuleButtonStyle(backgroundColor: .Primary, foregroundColor: .PrimaryContrast))
        .padding(.horizontal, 30)
        .sheet(isPresented: $isShowingSheet) {
            sheetPage
        }
    }
}
