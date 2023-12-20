//
//  UserContentListView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject private var viewModel: UserContentViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation

    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return (UIScreen.main.bounds.width ) / count - 16
    }

    init(user: UserModel) {
        self._viewModel = StateObject(wrappedValue: UserContentViewModel(user: user))
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack(content: {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold: .regular)

                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    })
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }

                }
            }
            LazyVStack(spacing: 20) {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView(user: DeveloperPreview.shraed.user)
}
