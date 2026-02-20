//
//  AlternatingView.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

import SwiftUI

struct AlternatingView<ViewA: View, ViewB: View>: View {
    @ViewBuilder var viewA: ViewA
    @ViewBuilder var viewB: ViewB
    
    @State private var viewAVisible: Bool = true
    
    var body: some View {
        VStack {
            if viewAVisible {
                viewA
            } else {
                viewB
            }
        }
        .onTapGesture {
            viewAVisible.toggle()
        }
    }
}

#Preview {
    AlternatingView {
        Color.red
    } viewB: {
        Color.blue
    }
}
