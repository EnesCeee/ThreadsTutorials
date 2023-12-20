//
//  CurrentUserProfileView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject private var viewModel = CurrentProfileViewModel()
    @State private var showEditProfile = false

    private var currentUser: UserModel? {
        return viewModel.currentUser
    }

    var body: some View {
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    // bio and stats
                    VStack(spacing: 20) {
                        ProfileHeaderView(user: currentUser)
                        Button(action: {
                            showEditProfile.toggle()
                        }, label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 352, height: 32)
                                .foregroundColor(.black)
                                .background(.white)
                                .cornerRadius(8)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(.systemGray4), lineWidth: 1))
                        })

                        // user content list view
                        if let user = currentUser {
                            UserContentListView(user: user)
                        }

                    }
                }
                .sheet(isPresented: $showEditProfile, content: {
                    if let user = currentUser {
                        EditProfileView(user: user)
                    }
                })
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            AuthService.shared.signOut()
                        }, label: {
                           Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                       })
                    }
                }
                .padding(.horizontal)

        }
    }
}

#Preview {
    CurrentUserProfileView()
}
