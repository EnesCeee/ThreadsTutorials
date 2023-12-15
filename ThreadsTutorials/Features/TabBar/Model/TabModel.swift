//
//  TabModel.swift
//  ThreadsTutorials
//
//  Created by Enes Ceylan on 13.12.2023.
//

import Foundation
import SwiftUI

struct HomeTabItem: Identifiable {
    let id = UUID()
    let page: AnyView
    let model: TabModel

    static let tabItems: [HomeTabItem] = [
        HomeTabItem(page: AnyView(FeedView()), model: TabModel(id: 0, title: .feedView, icon: .feedView)),
        HomeTabItem(page: AnyView(ExploreView()), model: TabModel(id: 1, title: .explore, icon: .explore)),
        HomeTabItem(page: AnyView(Text("")), model: TabModel(id: 2, title: .uploadThread, icon: .uploadThread)),
        HomeTabItem(page: AnyView(ActivityView()), model: TabModel(id: 3, title: .activity, icon: .activity)),
        HomeTabItem(page: AnyView(CurrentUserProfileView()), model: TabModel(id: 4, title: .profile, icon: .profile))
    ]
}

struct TabModel {
    let id: Int
    let title: LocaleKeys.TabView
    let icon: IconItems.TabView
}
