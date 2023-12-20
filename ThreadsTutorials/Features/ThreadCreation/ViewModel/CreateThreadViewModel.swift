//
//  CreateThreadViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
     var threadService: IThreadService

    init() {
        self.threadService = ThreadService()
    }

    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let threadModel = ThreadModel(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await threadService.uploadThread(threadModel)
    }
}
