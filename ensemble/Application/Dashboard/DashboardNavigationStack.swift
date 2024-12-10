//
//  SeasonView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

enum DashboardRoute: Equatable, Hashable {
    
    static func == (lhs: DashboardRoute, rhs: DashboardRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    case dashboardRoot
    case repertoire([Repertoire])
    
    var navigationTitle: String {
        switch self {
        case .dashboardRoot:
            return "Dashboard"
        case .repertoire:
            return "Repertoire"
        }
    }
    
    @ViewBuilder var destination: some View {
        switch self {
        case .dashboardRoot:
            DashboardRootView()
        case .repertoire(let repertoire):
            RepertoireView(repertoire: repertoire)
        }
    }
    
    func hash(into hasher: inout Hasher) {
            switch self {
            case .dashboardRoot:
                hasher.combine(0)
            case .repertoire(let repertoire):
                hasher.combine(1)
                hasher.combine(repertoire)
            }
        }
}

struct DashboardNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.dashboardRoutes) {
            DashboardRootView()
                .primaryToolbar(signedInState: state)
        }
    }
}
