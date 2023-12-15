//
//  ExploreViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
    
}
