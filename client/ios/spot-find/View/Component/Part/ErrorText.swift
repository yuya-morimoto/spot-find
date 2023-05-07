//
//  ErrorText.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/23.
//

import SwiftUI

struct ErrorText: View {
    let errorText: String?

    var body: some View {
        if let text = errorText {
            Text(text)
                .foregroundColor(Color.red)
                .font(.caption)
        }
    }
}

struct ErrorText_Previews: PreviewProvider {
    static var previews: some View {
        ErrorText(errorText: "エラーです")
    }
}
