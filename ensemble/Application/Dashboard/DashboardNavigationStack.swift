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
            DashboardRootView()
                .primaryToolbar(signedInState: state)
        }
    }
}

struct DashboardRootView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
