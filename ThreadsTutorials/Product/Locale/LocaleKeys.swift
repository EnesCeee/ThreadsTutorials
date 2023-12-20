//
//  LocaleKeys.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import SwiftUI

struct LocaleKeys {
    enum Auth: String {
        case facebook = "signInFacebook"
        case google = "signInGoogle"
        case apple = "signInApple"
        case custom = "signupWithEmail"
    }

    enum Buttons: String {
        case getStarted
    }

    enum General: String {
        case emailHint = "getStarted"
        case passwordHint
    }

    enum Login: String {
        case welcomeBack
        case createAccount
        case terms = "termsAndCondition"
    }

    enum TabView: String {
        case feedView = "feedWiew"
        case explore = "explore"
        case uploadThread = "uploadThread"
        case activity = "activity"
        case profile = "profile"
    }
}

extension String {
    /// It lolcalize any string from Localizable.string
    /// - Returns: Localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
