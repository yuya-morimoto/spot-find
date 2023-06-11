//
//  MyLocationSample.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/06/10.
//

import SwiftUI

struct MyLocationSample: View {
    @ObservedObject var locationDataManager = LocationManager()

    var body: some View {
        VStack {
            Button("test button") {
                print(locationDataManager.$authorizationStatus)
                locationDataManager.manager.requestAlwaysAuthorization()
            }

            switch locationDataManager.manager.authorizationStatus {
            case .authorizedWhenInUse:
                Text("Your current location is:")
                Text("Latitude: \(locationDataManager.manager.location?.coordinate.latitude.description ?? "Error loading")")
                Text("Longitude: \(locationDataManager.manager.location?.coordinate.longitude.description ?? "Error loading")")
            case .authorizedAlways:
                Text("Your current location is:")
                Text("Latitude: \(locationDataManager.manager.location?.coordinate.latitude.description ?? "Error loading")")
                Text("Longitude: \(locationDataManager.manager.location?.coordinate.longitude.description ?? "Error loading")")
            case .restricted, .denied:
                Text("Current location data was restricted or denied.")
            case .notDetermined:
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
    }
}
