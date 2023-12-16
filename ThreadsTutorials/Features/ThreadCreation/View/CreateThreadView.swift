//
//  CreateThreadView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject private var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) private var dismiss
    
    private var user : UserModel?{
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty{
                        Button(action: {
                            caption = ""
                        }, label: {
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
            .toolbar{
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
                    Button(action: {
                        Task{try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }, label: {
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
