//
//  LaunchScreen.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 19..
//

import SwiftUI

struct LaunchScreen<RootView: View, Logo: View>: Scene {
    var config: LaunchScreenConfig = .init()
    
    @ViewBuilder var logoContent: () -> Logo
    @ViewBuilder var rootContent: RootView
    
    var body: some Scene {
        WindowGroup {
            rootContent
                .modifier(LaunchScreenModifier(config: config, logo: logoContent))
        }
    }
}

fileprivate struct LaunchScreenModifier<Logo: View>: ViewModifier {
    var config: LaunchScreenConfig
    
    @ViewBuilder var logo: Logo
    @Environment(\.scenePhase) private var scenePhase
    @State private var splashWindow: UIWindow?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                let scenes = UIApplication.shared.connectedScenes
                
                for scene in scenes {
                    guard let windowScene = scene as? UIWindowScene,
                          checkStates(windowScene.activationState),
                          !windowScene.windows.contains(where: { $0.tag == 9999 })
                    else {
                        print("SplashWindow already added")
                        continue
                    }
                    
                    let window = UIWindow(windowScene: windowScene)
                    window.backgroundColor = .clear
                    window.isHidden = false
                    window.isUserInteractionEnabled = true
                    let rootViewController = UIHostingController(
                        rootView: LaunchScreenView(config: config) { logo }
                        isCompleted: {
                            window.isHidden = true
                            self.splashWindow = nil
                        }
                    )
                    window.rootViewController = rootViewController
                    rootViewController.view.backgroundColor = .clear
                    
                    self.splashWindow = window
                    print("SplashWindow added")
                }
            }
    }
    
    private func checkStates(_ state: UIWindowScene.ActivationState) -> Bool {
        switch scenePhase {
        case .active: return state == .foregroundActive
        case .inactive: return state == .foregroundInactive
        case .background: return state == .background
        default: return state.hashValue == scenePhase.hashValue
        }
    }
}

struct LaunchScreenConfig {
    var initialDelay: Double = 0.1
    var backgroundColor: Color = Color(red: 137/255, green: 207/255, blue: 240/255)
    var scaling: CGFloat = 20
    var animationDuration: CGFloat = 1
}

fileprivate struct LaunchScreenView<Logo: View>: View {
    var config: LaunchScreenConfig
    @ViewBuilder var logo: Logo
    var isCompleted: () -> Void
    
    @State private var startAnimation = false
    @State private var contentOpacity = 1.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(config.backgroundColor)
                .mask(
                    ZStack {
                        Rectangle()
                        logo
                            .scaleEffect(startAnimation ? config.scaling : 1.0)
                            .frame(width: 100, height: 100)
                            .blendMode(.destinationOut)
                    }
                )
        }
        .compositingGroup()
        .opacity(contentOpacity)
        .ignoresSafeArea()
        .task {
            try? await Task.sleep(for: Duration.seconds(config.initialDelay))
            withAnimation(.spring(response: config.animationDuration, dampingFraction: 0.8)) {
                startAnimation = true
            }
            try? await Task.sleep(for: Duration.seconds(config.animationDuration * 0.8))
            withAnimation(.easeIn(duration: 0.2)) {
                contentOpacity = 0
            }
            
            try? await Task.sleep(for: Duration.seconds(0.2))
            isCompleted()
        }
    }
}
