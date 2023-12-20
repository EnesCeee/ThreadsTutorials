//
//  UserContentViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Foundation

class UserContentViewModel: ObservableObject {
    @Published var threads = [ThreadModel]()

    let user: UserModel
    var threadService: IThreadService

    init(user: UserModel) {
        self.threadService = ThreadService()
        self.user = user
        Task {
            try await fetchUserThreads()
        }
    }

    @MainActor
    func fetchUserThreads() async throws {
       var threads = try await threadService.fetchUserThreads(uid: user.id)

        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
    }
}
