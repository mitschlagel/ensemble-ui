//
//  Main.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

@Observable class Router {
    var seasonRoutes: [SeasonRoute] = []
    var profileRoutes: [ProfileRoute] = []
    var settingsRoutes: [SettingsRoute] = []
}

enum Tab: Hashable, Identifiable, CaseIterable {
    case season
    case profile
    case settings
    
    var id: Tab { self }
}

extension Tab {
    
    @ViewBuilder var label: some View {
        switch self {
        case .season:
            Label("Season", systemImage: "calendar")
        case .profile:
            Label("Profile", systemImage: "person")
        case .settings:
            Label("Settings", systemImage: "gear")
        }
    }
    
    @ViewBuilder var destination: some View {
        switch self {
        case .season:
            SeasonNavigationStack()
        case .profile:
            ProfileNavigationStack()
        case .settings:
            SettingsNavigationStack()
        }
    }
}

struct MainContainer: View {
    @State private var router = Router()
    @State var selection: Tab?
    
    @StateObject var state: SignedInState
    
    var body: some View {
        Main(selection: $selection)
            .environment(router)
            .environmentObject(state)
    }
}

struct Main: View {
    
    @Binding var selection: Tab?
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Tab.allCases) { tab in
                tab.destination
                    .environmentObject(state)
                    .tag(tab as Tab?)
                    .tabItem { tab.label }
            }
        }
        
    }
}

//#Preview {
//    let state: SignedInState = SignedInState
//    LandingScreen(state)
//    
//}

