//
//  UserCell.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack{
            CircularProfileImageView()
            VStack{
                Text("maxverstappen1")
                    .fontWeight(.semibold)
                Text("Max Verstappen")

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
    UserCell()
}
