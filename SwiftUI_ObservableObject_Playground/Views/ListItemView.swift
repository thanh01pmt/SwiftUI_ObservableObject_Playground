//
//  ListItemView.swift
//  SwiftUI_ObservableObject_Playground
//
//  Created by Tony Pham on 18/5/25.
//

import SwiftUI

struct ListItemView: View {
    let itemData: ItemData
    @State private var tapCount: Int = 0

    //    init(item: ItemData) {
    //        self.itemData = item
    //        _tapCount = State(initialValue: 0)
    //        print("✅ ListItemView for '\(itemData.name)' INITIALIZED/RE-INITIALIZED. Tap count reset to: \(self.tapCount)")
    //    }

    var body: some View {
        HStack {
            Text(itemData.name)
            Spacer()
            Text("Taps: \(tapCount)")
            Button("Tap Me") {
                tapCount += 1
                print("👆 Button tapped for '\(itemData.name)'. New tap count: \(tapCount)")
            }
            .buttonStyle(.bordered)
        }
        .padding(.vertical, 3)
        .id(itemData.id)
    }
}
