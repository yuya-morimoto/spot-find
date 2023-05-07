//
//  StorePreview.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/29.
//

import ComposableArchitecture

enum StorePreview {
    static let authStore = Store(initialState: AuthState(), reducer: AuthReducer())
}
