//
//  RootView.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 19..
//

import SwiftUI

struct RootView: View {
    @State private var path: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $path) {
            ButtonList(items: ApplicationScreen.allCases) { selected in
                path.append(selected)
            }
            .buttonListRowBackground {
                SpecialButtonListBackground()
            }
            .navigationDestination(for: ApplicationScreen.self) { destination in
                destination.destination
            }
        }
    }
}

#Preview {
    RootView()
}
