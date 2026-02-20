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
            VStack {
                ButtonList(items: ApplicationScreen.allCases) { selected in
                    path.append(selected)
                }
                .buttonListRowBackground {
                    SpecialButtonListBackground()
                }
                .navigationDestination(for: ApplicationScreen.self) { destination in
                    destination.destination
                }
                .frame(height: 100)
                
                ButtonList(items: DummyList.allCases) { selected in
                    
                }
            }
        }
    }
}

enum DummyList: Hashable, Identifiable, CaseIterable {
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
    case eighth
    case ninth
    case tenth
    
    var id: Self { self }
}

extension DummyList: ListDisplayable {
    func localizedTitle() -> String {
        switch self {
        case .first:
            "First"
        case .second:
            "Second"
        case .third:
            "Third"
        case .fourth:
            "Fourth"
        case .fifth:
            "Fifth"
        case .sixth:
            "Sixth"
        case .seventh:
            "Seventh"
        case .eighth:
            "Eighth"
        case .ninth:
            "Ninth"
        case .tenth:
            "Tenth"
        }
    }
}

#Preview {
    RootView()
}
