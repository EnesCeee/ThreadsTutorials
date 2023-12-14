//
//  FeedView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: true) {
                LazyVStack(alignment: .leading) {
                    ForEach(0...10, id: \.self) { thread in
                        ThreadCell()
                    }
                }
              
            }
            .refreshable {
                print("DEBUG: Refresh threads")
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)

                })
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
    }
}
