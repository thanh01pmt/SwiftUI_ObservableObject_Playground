//
//  ContentView.swift
//  SwiftUI_ObservableObject_Playground
//
//  Created by Tony Pham on 18/5/25.
//

import SwiftUI

struct ContentView: View {
    // Một mảng dữ liệu đơn giản, cố định
    @State private var sampleItems: [ItemData] = [
        ItemData(name: "Mục A"),
        ItemData(name: "Mục B"),
        ItemData(name: "Mục C")
    ]

    // @State để điều khiển việc hiển thị List
    @State private var showList: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showList) {
                    Text("Hiển Thị Danh Sách")
                }
                .padding()
                .onChange(of: showList) { newValue in
                    print("--- Toggle changed. Show List is now: \(newValue) ---")
                }

                if showList {
                    List {
                        Section(header: Text("Danh Mục Chính")) {
                            ForEach($sampleItems) { $currentItem in
                                ListItemView(itemData: $currentItem)
                            }
                        }
                    }
                    .id("MyListWithItems")
                    .transition(.slide)
                    .onAppear{
                        print("--- List with items APPEARED ---")
                    }
                    .onDisappear{
                        print("--- List with items DISAPPEARED ---")
                    }

                } else {
                    // Khi showList là false, một View khác (hoặc không có gì) được hiển thị
                    Text("Danh sách đang bị ẩn.")
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .onAppear{
                            print("--- 'List Hidden' placeholder APPEARED ---")
                        }
                        .onDisappear{
                            print("--- 'List Hidden' placeholder DISAPPEARED ---")
                        }
                }
                Spacer() // Đẩy mọi thứ lên trên
            }
            .navigationTitle("Demo Mất Trạng Thái")
        }
    }
}

#Preview {
    ContentView()
}
