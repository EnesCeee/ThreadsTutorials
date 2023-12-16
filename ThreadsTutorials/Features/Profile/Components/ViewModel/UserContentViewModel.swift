//
//  UserContentViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Foundation

class UserContentViewModel : ObservableObject{
    @Published var threads = [ThreadModel]()
    
    let user: UserModel
    
    init(user: UserModel) {
        self.user = user
        Task{
            try await fetchUserThreads()
        }
    }
    
    @MainActor
    func fetchUserThreads() async throws{
       var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count{
            threads[i].user = self.user
        }
        self.threads = threads
    }
}
