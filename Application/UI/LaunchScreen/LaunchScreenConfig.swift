//
//  LaunchScreenConfig.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

import SwiftUI

struct LaunchScreenConfig {
    var initialDelay: Double = 0.1
//    var backgroundColor: Color = Color(red: 137/255, green: 207/255, blue: 240/255)
    var backgroundColor: Color = Color(hex: "#89CFF0") ?? .white
    var scaling: CGFloat = 20
    var animationDuration: CGFloat = 0.5
}
