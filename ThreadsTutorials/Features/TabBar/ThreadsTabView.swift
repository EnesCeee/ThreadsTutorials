//
//  ThreadsTabView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 1
    @State private var showCreateThreadView = false

    var body: some View {
        TabView {
            ForEach(HomeTabItem.tabItems) { item in
                item.page.tabItem {
                    TabIconLabel(model: item.model, id: item.model.id, selectedTab: $selectedTab)
                }
                .onAppear {selectedTab = item.model.id}
                .tag(item.model.id)
            }
        }
        .onChange(of: selectedTab) {
            showCreateThreadView = selectedTab == 2
        }
        .sheet(isPresented: $showCreateThreadView, onDismiss: {
            selectedTab = 0
            print("")
        }, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}

private struct TabIconLabel: View {
    let model: TabModel
    let id: Int
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            Image(systemName: model.icon.rawValue)
        }

    }
}
