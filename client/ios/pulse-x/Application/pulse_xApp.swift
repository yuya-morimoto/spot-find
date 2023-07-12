//
//  pulse_xApp.swift
//  pulse-x
//
//  Created by Yuya Morimoto on R 5/04/22.
//

import ComposableArchitecture
import FirebaseAuth
import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor(Color.AccentColor)

        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        return true
    }
}

@main
struct pulse_xApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
