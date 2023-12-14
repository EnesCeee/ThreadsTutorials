//
//  CreateThreadView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView()
                    VStack(alignment: .leading, spacing: 4){
                        Text("maxverstappen1")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        })
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Post")
                            .opacity(caption.isEmpty ? 0.5 : 1.0)
                            .disabled(caption.isEmpty)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    })
                }
        }
        }
    }
}

#Preview {
    CreateThreadView()
}
