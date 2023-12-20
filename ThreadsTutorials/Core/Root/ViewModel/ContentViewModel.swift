//
//  ContentViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()

    var contentService: AuthService

    init() {
        self.contentService = AuthService()
        setupSubscribers()
    }

    private func setupSubscribers() {
        contentService.$userSession
            .sink { [weak self] user in
                self?.userSession = user
            }.store(in: &cancellables)
    }

}

// @Published var userSession: FirebaseAuth.User?
// private var cancellables = Set<AnyCancellable>()
//
// var contentService: IAuthService
//
// init() {
//    self.contentService = AuthService()
//    setupSubscribers()
// }
//
// private func setupSubscribers(){
//    contentService.userSession
//        .sink { [weak self] user in
//            self?.userSession = user
//        }.store(in: &cancellables)
// }
