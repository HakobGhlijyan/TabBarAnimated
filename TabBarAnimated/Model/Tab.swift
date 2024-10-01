//
//  Tab.swift
//  TabBarAnimated
//
//  Created by Hakob Ghlijyan on 01.10.2024.
//

import SwiftUI

// Tab's
enum Tab: String, CaseIterable {
    case photo = "photo.stack"
    case chat = "bubble.left.and.text.bubble.right"
    case apps = "square.3.layers.3d"
    case notifications = "bell.and.waves.left.and.right"
    case profile = "person.2.crop.square.stack.fill"

    var title: String {
        switch self {
        case .photo:
            "Photos"
        case .chat:
            "Chat"
        case .apps:
            "Apps"
        case .notifications:
            "Notifications"
        case .profile:
            "Profile"
        }
    }
}

// Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimating: Bool?
}

