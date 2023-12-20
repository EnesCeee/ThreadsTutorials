//
//  ProfileViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import Foundation
import Combine

class CurrentProfileViewModel: ObservableObject {
    @Published var currentUser: UserModel?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
    }

    private func setupSubscribers() {
         UserService.shared.$currentUser
            .sink { [weak self] user in
                self?.currentUser = user
            }
            .store(in: &cancellables)
    }

}
