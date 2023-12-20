//
//  ProfileView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: UserModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            // bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 32)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(8)
                })

                // user content list view
                UserContentListView(user: user)

            }
        }
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
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)

    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shraed.user)
}
