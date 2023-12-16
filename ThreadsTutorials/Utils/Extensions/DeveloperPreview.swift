//
//  DeveloperPreview.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import SwiftUI
import Firebase
extension PreviewProvider {
    static var dev: DeveloperPreview {
       return DeveloperPreview.shraed
    }
}

class DeveloperPreview{
    static let shraed = DeveloperPreview()
    
    let user = UserModel(id: NSUUID().uuidString, fullname: "Enes Ceylan", email: "ceylanenes@example.com", username: "enesceylan")
    
    let thread = ThreadModel(ownerUid: "123", caption: "This is a test thread", timestamp: Timestamp(), likes: 0)
}
