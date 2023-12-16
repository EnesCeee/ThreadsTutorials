//
//  ThreadCell.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import SwiftUI

struct ThreadCell: View {
    let thread: ThreadModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)

                VStack(alignment: .leading) {
                    HStack {
                        Text(thread.user? .username ?? "")
                            .font(.footnote)
                        .fontWeight(.semibold)
                        Spacer()
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray))
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        })
                    }
                    Text(thread.caption)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    
                    HStack(spacing: 16) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "heart")
                                .foregroundColor(Color(.darkGray))
                        })
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                                .foregroundColor(Color(.darkGray))
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "arrow.rectanglepath")
                                .foregroundColor(Color(.darkGray))
                        })
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "paperplane")
                                .foregroundColor(Color(.darkGray))
                        })
                
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
        }
        }
            Divider()
    }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shraed.thread)
}
