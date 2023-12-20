//
//  AuthTests.swift
//  ThreadsTutorialsTests
//
//  Created by Enes Ceylan on 20.12.2023.
//

import XCTest
import Combine
import Firebase
@testable import ThreadsTutorials

final class AuthTests: XCTestCase {

    var authService: AuthService!
        var cancellables: Set<AnyCancellable> = []

        override func setUpWithError() throws {
            authService = AuthService.shared
        }

        override func tearDownWithError() throws {
            authService = nil
            cancellables.removeAll()
        }

        func testLogin() async throws {
            let email = "test@example.com"
            let password = "password"

            do {
                try await authService.login(withEmail: email, password: password)
                XCTFail("Login should throw an error in this test")
            } catch {
                XCTAssertNotNil(error, "Login should fail with an error")
            }
        }

        func testCreateUser() async throws {
            let email = "test@example.com"
            let password = "password"
            let fullname = "John Doe"
            let username = "johndoe"

            do {
                try await authService.createUser(withEmail: email, password: password, fullname: fullname, username: username)
                // Add assertions for successful user creation if needed
            } catch {
                XCTFail("Creating user failed with error: \(error.localizedDescription)")
            }
        }

    func testSignOut() async throws {
        // Set up initial user session
        authService.userSession = Auth.auth().currentUser

        // Call signOut and wait for it to complete
        authService.signOut()

        // Assert that user session is nil after signing out
        XCTAssertNil(authService.userSession, "User session should be nil after signing out")

        // Add additional assertions as needed
    }


        // Add more test cases as needed

}


