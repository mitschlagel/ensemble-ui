//
//  SeasonView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

enum DashboardRoute: Hashable {
    case dashboard
    case detail(String)
    
    @ViewBuilder var destination: some View {
        switch self {
        case .dashboard:
            Text("Dashboard View")
        case .detail(let detail):
            Text("Dashboard \(detail) View")
        }
    }
}

struct DashboardNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.dashboardRoutes) {
            VStack {
                Text("Dashboard View")
            }
            .primaryToolbar(signedInState: state)
        }
    }
}