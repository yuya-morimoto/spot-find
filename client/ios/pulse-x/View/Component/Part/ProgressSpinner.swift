//
//  ProgressSpinner.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/05/01.
//

import SwiftUI

struct ProgressSpinner: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    @State private var opacity: Double = 0.1

    var body: some View {
        ZStack {
            Color.Primary
                .ignoresSafeArea()
                .opacity(opacity)
                .animation(.easeOut(duration: 1).repeatForever(), value: opacity)
                .onAppear {
                    self.opacity = 0.2
                }

            ProgressView()
                .scaleEffect(x: 2, y: 2, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .Primary))
        }
    }
}

struct ProgressSpinner_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSpinner()
    }
}
