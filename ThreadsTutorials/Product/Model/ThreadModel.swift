//
//  ThreadModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadModel: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int

    var id: String {
        return threadId ?? UUID().uuidString
    }

    var user: UserModel?
}
