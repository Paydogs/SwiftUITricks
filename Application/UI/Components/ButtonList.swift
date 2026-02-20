//
//  ButtonList.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

import SwiftUI

protocol ListDisplayable: Hashable, Identifiable {
    func localizedTitle() -> String
}

protocol ButtonListBackground: View {}

struct ButtonList<Element, RowBackground>: View where Element: ListDisplayable, RowBackground: ButtonListBackground {
    let items: [Element]
    let rowBackground: RowBackground
    let onSelect: (Element) -> Void
    
    init(
        items: [Element],
        rowBackground: RowBackground = DefaultButtonListBackground(),
        onSelect: @escaping (Element) -> Void
    ) {
        self.items = items
        self.rowBackground = rowBackground
        self.onSelect = onSelect
    }
    
    var body: some View {
        let _ = Self._printChanges()
        print("Drawing ButtonList")
        return List {
            ForEach(items) { item in
                Text(item.localizedTitle())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture(perform: {
                        onSelect(item)
                    })
                    .listRowBackground(rowBackground)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

extension ButtonList {
    func buttonListRowBackground<NewBackground: View>(
        @ViewBuilder _ background: () -> NewBackground
    ) -> ButtonList<Element, NewBackground> {
        print("Adding buttonListRowBackground")
        return ButtonList<Element, NewBackground>(
            items: items,
            rowBackground: background(),
            onSelect: onSelect
        )
    }
}

#Preview {
    ButtonList(items: [ApplicationScreen.alternatingScreen]) { _ in }
}

#Preview {
    ButtonList(items: [ApplicationScreen.alternatingScreen]) { _ in }
        .buttonListRowBackground {
            DefaultButtonListBackground()
        }
}
