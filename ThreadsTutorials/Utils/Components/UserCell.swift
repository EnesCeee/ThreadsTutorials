//
//  UserCell.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import SwiftUI

struct UserCell: View {
    let user: UserModel
    
    var body: some View {
        HStack{
            CircularProfileImageView(user: user, size: .small)
            VStack(alignment: .leading, spacing: 2){
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)

            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .fontWeight(.semibold)
                .font(.subheadline)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 32)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4), lineWidth: 1))

        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user:  DeveloperPreview.shraed.user)
}
