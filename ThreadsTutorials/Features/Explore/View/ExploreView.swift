//
//  ExploreView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                LazyVStack(alignment: .leading) {
                    ForEach(0...10, id: \.self) { thread in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
