//
//  ContentViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import Foundation
import Combine
import Firebase

class ContentViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession
            .sink { [weak self] user in
                self?.userSession = user
            }.store(in: &cancellables)
    }
    
}
