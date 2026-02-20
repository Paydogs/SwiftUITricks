//
//  ButtonListStyles.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

import SwiftUI

struct DefaultButtonListBackground: ButtonListBackground {
    var body: some View {
        LinearGradient(
            colors: [.blue.opacity(0.2), .blue.opacity(0.7)],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

struct SpecialButtonListBackground: ButtonListBackground {
    var body: some View {
        LinearGradient(
            colors: [.red.opacity(0.2), .blue.opacity(0.7)],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
