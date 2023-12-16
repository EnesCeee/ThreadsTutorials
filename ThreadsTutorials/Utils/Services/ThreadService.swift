//
//  ThreadService.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ threadModel: ThreadModel) async throws {
        
        guard let threadData = try? Firestore.Encoder().encode(threadModel) else {return}
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads () async throws -> [ThreadModel] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        let threads = try snapshot.documents.compactMap({try $0.data(as: ThreadModel.self)})
        return threads
    }
    
    static func fetchUserThreads(uid: String) async throws -> [ThreadModel] {
        let snapshot = try await Firestore
            .firestore()
            .collection("threads")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        let threads = try snapshot.documents.compactMap({try $0.data(as: ThreadModel.self)})
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
