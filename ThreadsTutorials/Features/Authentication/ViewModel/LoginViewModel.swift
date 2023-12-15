//
//  LoginViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published  var email = ""
    @Published  var password = ""

    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.login(
            withEmail: email,
            password: password
        )
    }

}
