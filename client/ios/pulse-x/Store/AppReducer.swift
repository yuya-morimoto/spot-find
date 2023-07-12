//
//  AppReducer.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import ComposableArchitecture

typealias AppStore = StoreOf<AppReducer>
typealias AppViewStore = ViewStoreOf<AppReducer>

struct AppReducer: ReducerProtocol {
    struct State: Equatable {
        var auth: AuthReducer.State
        var ui: UiReducer.State

        init() {
            self.auth = AuthReducer.State()
            self.ui = UiReducer.State()
        }
    }

    enum Action: Equatable {
        case auth(AuthReducer.Action)
        case ui(UiReducer.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.auth, action: /Action.auth) {
            AuthReducer()
        }
        Scope(state: \.ui, action: /Action.ui) {
            UiReducer()
        }
    }
}
