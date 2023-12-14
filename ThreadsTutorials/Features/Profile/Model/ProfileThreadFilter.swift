//
//  ProfileThreadFilter.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 14.12.2023.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        }
    }
    
    var id: Int{
        return self.rawValue
    }
}
