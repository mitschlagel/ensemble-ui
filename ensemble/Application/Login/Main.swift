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

enum Screen: Hashable, Identifiable, CaseIterable {
    case season
    case profile
    case settings
    
    var id: Screen { self }
}

extension Screen {
    
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
    
    @ViewBuilder func destination(state: SignedInState) -> some View {
        switch self {
        case .season:
            SeasonNavigationStack(state: state)
        case .profile:
            ProfileNavigationStack(state: state)
        case .settings:
            SettingsNavigationStack(state: state)
        }
    }
}

struct MainContainer: View {
    @State private var router = Router()
    @State var selection: Screen?
    
    var state: SignedInState
    
    var body: some View {
        Main(selection: $selection, state: state)
            .environment(router)
    }
}

struct Main: View {
    
    @Binding var selection: Screen?
    var state: SignedInState
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Screen.allCases) { screen in
                screen.destination(state: state)
                    .tag(screen as Screen?)
                    .tabItem { screen.label }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button("Sign out") {
                        Task {
                            await state.signOut()
                        }
                    }
                } label: {
                    Label("Menu", systemImage: "person.fill")
                }
            }
        })
    }
}

//#Preview {
//    let state: SignedInState = SignedInState
//    LandingScreen(state)
//    
//}

