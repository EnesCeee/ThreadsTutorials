//
//  Timestamp.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 16.12.2023.
//

import Foundation
import Firebase

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: self.dateValue(), to: now) ?? ""
    }
}
