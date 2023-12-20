//
//  ThreadService.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol IThreadService {
    func uploadThread(_ threadModel: ThreadModel) async throws
    func fetchThreads() async throws -> [ThreadModel]
    func fetchUserThreads(uid: String) async throws -> [ThreadModel]
}

struct ThreadService: IThreadService {

    func uploadThread(_ threadModel: ThreadModel) async throws {

        guard let threadData = try? Firestore.Encoder().encode(threadModel) else {return}
        try await Firestore.firestore().collection(Collections.threads.rawValue).addDocument(data: threadData)
    }

    func fetchThreads () async throws -> [ThreadModel] {
        let snapshot = try await Firestore
            .firestore()
            .collection(Collections.threads.rawValue)
            .order(by: "timestamp", descending: true)
            .getDocuments()
        let threads = try snapshot.documents.compactMap({try $0.data(as: ThreadModel.self)})
        return threads
    }

    func fetchUserThreads(uid: String) async throws -> [ThreadModel] {
        let snapshot = try await Firestore
            .firestore()
            .collection(Collections.threads.rawValue)
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        let threads = try snapshot.documents.compactMap({try $0.data(as: ThreadModel.self)})
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}
