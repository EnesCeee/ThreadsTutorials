//
//  DeveloperPreview.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 15.12.2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
       return DeveloperPreview.shraed
    }
}

class DeveloperPreview{
    static let shraed = DeveloperPreview()
    
    let user = UserModel(id: NSUUID().uuidString, fullname: "Enes Ceylan", email: "ceylanenes@example.com", username: "enesceylan")
}
