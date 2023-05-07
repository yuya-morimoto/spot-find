//
//  ErrorState.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/23.
//

import ComposableArchitecture
import FirebaseAuth
import SwiftUI

enum ErrorState: Error, Equatable {
    case sendEmailVerificatioinError
    case passwordFormatValid
    case invalidEmailError
    case emailAlreadyInUse
    case weakPassword
    case userNotFound
    case wrongPassword
    case userDisabled
    case error
    case unexpectedError

    var code: Int {
        switch self {
        case .sendEmailVerificatioinError:
            return 4001
        case .passwordFormatValid:
            return 4500
        case .invalidEmailError:
            // 17008
            return AuthErrorCode.invalidEmail.rawValue
        case .emailAlreadyInUse:
            // 17007
            return AuthErrorCode.emailAlreadyInUse.rawValue
        case .weakPassword:
            // 17026
            return AuthErrorCode.weakPassword.rawValue
        case .userNotFound:
            // 17011
            return AuthErrorCode.userNotFound.rawValue
        case .wrongPassword:
            // 17009
            return AuthErrorCode.wrongPassword.rawValue
        case .userDisabled:
            // 17005
            return AuthErrorCode.userDisabled.rawValue
        case .error:
            return 9998
        case .unexpectedError:
            return 9999
        }
    }

    var message: String {
        switch self {
        case .sendEmailVerificatioinError:
            return "確認用メールの送信に失敗しました"
        case .passwordFormatValid:
            return "パスワードは8-16文字の半角英数字で入力してください"
        case .invalidEmailError:
            return "メールアドレスの形式が違います"
        case .emailAlreadyInUse:
            return "このメールアドレスはすでに使われています。"
        case .weakPassword:
            return "パスワードが弱すぎます"
        case .userNotFound, .wrongPassword:
            return "メールアドレスまたはパスワードが間違っています"
        case .userDisabled:
            return "このユーザーアカウントは無効化されています"
        case .error:
            return "処理に失敗しました"
        case .unexpectedError:
            return "予期せぬエラーが発生しました。しばらく時間を置いてから再度お試しください"
        }
    }
}

extension ErrorState {
    static func codeToErrorState(code: Int) -> ErrorState {
        switch code {
        case AuthErrorCode.invalidEmail.rawValue:
            return .invalidEmailError
        case AuthErrorCode.emailAlreadyInUse.rawValue:
            return .emailAlreadyInUse
        case AuthErrorCode.weakPassword.rawValue:
            return .weakPassword
        case AuthErrorCode.userNotFound.rawValue:
            return .userNotFound
        case AuthErrorCode.wrongPassword.rawValue:
            return .wrongPassword
        case AuthErrorCode.userDisabled.rawValue:
            return .userDisabled
        default:
            return .unexpectedError
        }
    }
}
