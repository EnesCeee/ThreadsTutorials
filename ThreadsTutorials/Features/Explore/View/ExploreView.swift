//
//  ExploreView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @StateObject private var viewModel = ExploreViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user: user)
                                Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationDestination(for: UserModel.self) { user in
                ProfileView(user: user)
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
