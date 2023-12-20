//
//  LoginViewModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""

    var loginService: IAuthService

    init() {
        self.loginService = AuthService()
    }

    @MainActor
    func loginUser() async throws {
        try await loginService.login(withEmail: email, password: password)
    }

}
