//
//  ProfileHeaderView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: UserModel?
    
    init(user: UserModel?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                //fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            CircularProfileImageView()
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shraed.user)
}
