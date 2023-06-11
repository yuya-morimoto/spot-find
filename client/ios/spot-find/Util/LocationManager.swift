//
//  LocationManager.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/06/10.
//

import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var manager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var region = MKCoordinateRegion()
    
    override init() {
        super.init()
        manager.delegate = self

        // 現在地を取得できる場合にはデフォルトで現在地を指定する(位置情報を許可していないとMap表示しないため問題ない)
        if let latitude = manager.location?.coordinate.latitude {
            if let longitude = manager.location?.coordinate.longitude {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: latitude,
                                                   longitude: longitude),
                    latitudinalMeters: LocationManager.DEFAULT_LATITUDE,
                    longitudinalMeters: LocationManager.DEFAULT_LONGITUDE
                )
            }
        }
    }
    
    func locationManagerDidChangeAuthorization(_ locationManager: CLLocationManager) {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            // 常に許可
            if let latitude = manager.location?.coordinate.latitude {
                if let longitude = manager.location?.coordinate.longitude {
                    region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: latitude,
                                                       longitude: longitude),
                        latitudinalMeters: LocationManager.DEFAULT_LATITUDE,
                        longitudinalMeters: LocationManager.DEFAULT_LONGITUDE
                    )
                }
            }
            
        case .authorizedWhenInUse:
            // 使用中のみ許可
            authorizationStatus = .authorizedWhenInUse
            manager.requestAlwaysAuthorization()
            if let latitude = manager.location?.coordinate.latitude {
                if let longitude = manager.location?.coordinate.longitude {
                    region = MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: latitude,
                                                       longitude: longitude),
                        latitudinalMeters: LocationManager.DEFAULT_LATITUDE,
                        longitudinalMeters: LocationManager.DEFAULT_LONGITUDE
                    )
                }
            }
            
        case .restricted:
            // 位置情報が制限されている
            authorizationStatus = .restricted
            
        case .denied:
            // 位置情報へのアクセスが拒否されている
            authorizationStatus = .denied
            
        case .notDetermined:
            // 位置情報の許可が要求されていない
            authorizationStatus = .notDetermined
            manager.requestAlwaysAuthorization()
            
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let center = CLLocationCoordinate2D(
                latitude: $0.coordinate.latitude,
                longitude: $0.coordinate.longitude
            )

            // 地図を表示するための領域を再構築
            region = MKCoordinateRegion(
                center: center,
                latitudinalMeters: LocationManager.DEFAULT_LATITUDE,
                longitudinalMeters: LocationManager.DEFAULT_LONGITUDE
            )
            print(region.center.latitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}

extension LocationManager {
    static let DEFAULT_LATITUDE = 1000.0
    static let DEFAULT_LONGITUDE = 1000.0
}
