//
//  EditProfileView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false

    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    // name and profile image
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Charles Leclerc")
                            
                        }
                        .font(.footnote)
                        Spacer()

                        CircularProfileImageView()
                    }
                    Divider()
                    
                    //bio field
                    
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio )
                    }
                    .font(.footnote)
                    Divider()
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add Link...", text: $link )
                    }
                    .font(.footnote)
                    Divider()
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
           
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Done")
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
    EditProfileView()
}
