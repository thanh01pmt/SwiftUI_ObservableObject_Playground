//
//  ItemData.swift
//  SwiftUI_ObservableObject_Playground
//
//  Created by Tony Pham on 18/5/25.
//

import Foundation

struct ItemData: Identifiable {
    let id = UUID()
    let name: String
    var tapCount: Int = 0
}
