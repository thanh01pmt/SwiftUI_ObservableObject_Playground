//
//  ListItemView.swift
//  SwiftUI_ObservableObject_Playground
//
//  Created by Tony Pham on 18/5/25.
//

import SwiftUI

struct ListItemView: View {
    @Binding var itemData: ItemData

    var body: some View {
        HStack {
            Text(itemData.name)
            Spacer()
            Text("Taps: \(itemData.tapCount)")
            Button("Tap Me") {
                itemData.tapCount += 1
                print("👆 Button tapped for '\(itemData.name)'. New tap count: \(itemData.tapCount)")
            }
            .buttonStyle(.bordered)
        }
        .padding(.vertical, 3)
        .id(itemData.id)
    }
}
