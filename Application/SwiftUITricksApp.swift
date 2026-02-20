//
//  SwiftUITricksApp.swift
//  EmptyTuist
//
//  Created by Andras Olah on 2026. 01. 31..
//

import SwiftUI

@main
struct SwiftUITricksApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        LaunchScreen {
            Image(.launchScreenLogo)
        } rootContent: {
            RootView()
        } loadingTask: {
            try? await DummyLoadingTask.load(for: 2)
        }


    }
}
