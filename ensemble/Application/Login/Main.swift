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
    var ensembleRoutes: [EnsembleRoute] = []
    var dashboardRoutes: [DashboardRoute] = []
}

enum Tab: Hashable, Identifiable, CaseIterable {
    case dashboard
    case season
    case ensemble
    var id: Tab { self }
}

extension Tab {
    
    @ViewBuilder var label: some View {
        switch self {
        case .dashboard:
            Image(systemName: "house")
            //Label("Dashboard", systemImage: "house")
        case .season:
            Image(systemName: "calendar")
            //Label("Season", systemImage: "calendar")
        case .ensemble:
            Image(systemName: "person.3")
           // Label("Ensemble", systemImage: "person.3")
        
        }
    }
    
    @ViewBuilder var destination: some View {
        switch self {
        case .season:
            SeasonNavigationStack()
        case .ensemble:
            EnsembleNavigationStack()
        case .dashboard:
            DashboardNavigationStack()
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

