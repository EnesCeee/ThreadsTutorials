//
//  FeedViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {

    @Published var threads = [ThreadModel]()

    var threadService: IThreadService

    init() {
        self.threadService = ThreadService()
        Task {
            try await fetchThreads()
        }
    }

    func fetchThreads() async throws {
        self.threads = try await threadService.fetchThreads()
        try await fetchUserDataForThread()
    }

    private func fetchUserDataForThread() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            threads[i].user = threadUser
        }
    }
}
