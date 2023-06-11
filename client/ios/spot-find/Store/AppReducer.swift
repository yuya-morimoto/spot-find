//
//  AppReducer.swift
//  spot-find
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
        var location: LocationReducer.State

        init() {
            self.auth = AuthReducer.State()
            self.ui = UiReducer.State()
            self.location = LocationReducer.State()
        }
    }

    enum Action: Equatable {
        case auth(AuthReducer.Action)
        case ui(UiReducer.Action)
        case location(LocationReducer.Action)
    }

    var body: some ReducerProtocol<State, Action> {
        Scope(state: \.auth, action: /Action.auth) {
            AuthReducer()
        }
        Scope(state: \.ui, action: /Action.ui) {
            UiReducer()
        }
        Scope(state: \.location, action: /Action.location) {
            LocationReducer()
        }
    }
}
