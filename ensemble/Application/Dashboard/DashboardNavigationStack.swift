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
    case program(Program)
    case repertoire([Repertoire])
    case services(Program)
    
    var navigationTitle: String {
        switch self {
        case .dashboardRoot:
            return "Dashboard"
        case .program(let program):
            return "\(program.id): \(program.title)"
        case .repertoire:
            return "Repertoire"
        case .services:
            return "Services"
        }
    }
    
    @ViewBuilder var destination: some View {
        switch self {
        case .dashboardRoot:
            DashboardRootView()
        case .program(let program):
            ProgramView(program)
        case .repertoire(let repertoire):
            RepertoireView(repertoire: repertoire)
        case .services(let program):
            ServicesView(program: program)
        }
    }
    
    func hash(into hasher: inout Hasher) {
            switch self {
            case .dashboardRoot:
                hasher.combine(0)
            case .repertoire(let repertoire):
                hasher.combine(1)
                hasher.combine(repertoire)
            case .services(let services):
                hasher.combine(2)
                hasher.combine(services)
            case .program(let program):
                hasher.combine(3)
                hasher.combine(program)
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
