//
//  AlternatingScreen.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

import SwiftUI

struct AlternatingScreen: View {
    var body: some View {
        Text("Alternating view")
            .padding()
        AlternatingView {
            ZStack {
                Color.red
                Text("A")
                    .font(.largeTitle)
            }
        } viewB: {
            ZStack {
                Color.blue
                Text("B")
                    .font(.largeTitle)
            }
        }
        .frame(height: 200)
        Spacer()
    }
}

#Preview {
    AlternatingScreen()
}
