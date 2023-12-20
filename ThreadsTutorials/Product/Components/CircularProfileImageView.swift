//
//  CircularProfileImageView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    var user: UserModel?
    let size: ProfileImageSize

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))

        }
    }
}

#Preview {
    CircularProfileImageView(user: DeveloperPreview.shraed.user, size: .medium)
}
