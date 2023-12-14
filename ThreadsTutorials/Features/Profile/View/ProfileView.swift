//
//  ProfileView.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat{
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return (UIScreen.main.bounds.width ) / count - 16
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            //bio and stats
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        //fullname and username
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Charles Leclerc")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Text("charles_leclerc")
                        }
                        Text("Formula 1 drive for Scuderia Ferrari")
                            .font(.footnote)
                        
                        Text("2 followers")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    
                    CircularProfileImageView()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 352, height: 32)
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(8)
                })
                
                //user content list view
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack(content: {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold: .regular)
                                
                                if(selectedFilter == filter){
                                    Rectangle()
                                        .foregroundStyle(.black)
                                        .frame(width: filterBarWidth, height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                }
                                else{
                                    Rectangle()
                                        .foregroundStyle(.clear)
                                        .frame(width: filterBarWidth, height: 1)
                                }
                            })
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                           
                        }
                    }
                    LazyVStack(spacing: 20) {
                        ForEach(0...10, id: \.self) { thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)

            }
        }
        .padding(.horizontal)

    }
}

#Preview {
    ProfileView()
}
