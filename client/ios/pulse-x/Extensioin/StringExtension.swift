//
//  StringExtension.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import Foundation

extension String {
    var isValidEmailFormat: String? {
        // errorMessage or nil(ok)
        let emailRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        if emailTest.evaluate(with: self) {
            return nil
        } else {
            return "メールアドレスの形式が違います"
        }
    }

    var isValidPasswordFormat: String? {
        // errorMessage or nil(ok)
        let passwordRegex = "^(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z!#\\$%&()*+,-./:;<=>?@\\[\\]^_`{|}~]{8,16}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if passwordTest.evaluate(with: self) {
            return nil
        } else {
            return "パスワードは8-16文字の半角英数字で入力してください"
        }
    }
}
