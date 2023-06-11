//
//  LocationReducer.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/06/12.
//

import ComposableArchitecture

struct LocationReducer: ReducerProtocol {
    func reduce(into state: inout LocationState, action: LocationAction) -> EffectTask<LocationAction> {}
}
