//
//  CircularProfileImageView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("ic_app_threads")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
