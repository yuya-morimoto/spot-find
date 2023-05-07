//
//  CapsuleButtonStyle.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/29.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
 
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .fontWeight(.semibold)
            .font(.footnote)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}
