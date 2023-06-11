//
//  AppTopPage.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/22.
//

import ComposableArchitecture
import MapKit
import SwiftUI

struct AppTopPage: View {
    @Dependency(\.zeusClient) var zeusClient
    
    @ObservedObject var manager = LocationManager()
    
    let store: AppStore

    var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                Map(coordinateRegion: $manager.region,
                    interactionModes: .all,
                    showsUserLocation: true)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Button("ログアウトする") {
                        viewStore.send(.auth(.signOut))
                    }.buttonStyle(CapsuleButtonStyle(backgroundColor: .Primary, foregroundColor: .PrimaryContrast))
                    Button(EnvVariables.zeusEndpoint) {
                        zeusClient.fetch(query: GraphQL.CheckQuery()) { result in
                            guard let data = try? result.get().data else { return }
                            print(data.check.id)
                            print(data.check.message)
                        }
                    }.buttonStyle(CapsuleButtonStyle(backgroundColor: .Primary, foregroundColor: .PrimaryContrast))
                    //MyLocationSample()
                }.padding()
            }
        }
    }
}
