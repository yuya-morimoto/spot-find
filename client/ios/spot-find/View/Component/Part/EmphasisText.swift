//
//  EmphasisText.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import SwiftUI

struct EmphasisText: View {
    let text: String

    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.ForegroundColor)
                .font(.caption)
                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
        }.background(Color.EmphasisBackgroundColor)
            .cornerRadius(10)
    }
}

struct EmphasisText_Previews: PreviewProvider {
    static var previews: some View {
        EmphasisText(text: "example@spot-find.jp")
    }
}
