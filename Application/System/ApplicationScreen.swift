//
//  AppScreens.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

import SwiftUI

enum ApplicationScreen: Hashable, Identifiable, CaseIterable {
    case alternatingScreen
    
    var id: Self { self }
}

extension ApplicationScreen {
    @ViewBuilder
    var destination: some View {
        switch self {
        case .alternatingScreen:
            AlternatingScreen()
        }
    }
}

extension ApplicationScreen: ListDisplayable {
    func localizedTitle() -> String {
        switch self {
        case .alternatingScreen:
            "Altering Screen"
        }
    }
}
