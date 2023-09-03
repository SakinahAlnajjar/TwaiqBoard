//
//  TwaiqBoardApp.swift
//  TwaiqBoard
//
//  Created by سكينه النجار on 03/09/2023.
//

import SwiftUI
import FirebaseCore
@main
struct TwaiqBoardApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @AppStorage("isOnBoarded") var isOnborded: Bool = false
    @ObservedObject var viewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isOnborded {
                    if viewModel.isSiginIn == true {
                        TabBarView()
                    } else {
                        LoginView()
                    }
                } else {
                    Onboarding()
                }
            }
            .environmentObject(viewModel)
        }
    }
}
class AppDelegate: NSObject , UIApplicationDelegate{
            func application( _application:UIApplication, didFinishLaunchingWithOptions LaunchOptions:
                              [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
                FirebaseApp.configure()
                return true
            }
        }


