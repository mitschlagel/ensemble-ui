//
//  SeasonNavigationStack.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

enum SeasonRoute: Hashable {
    case season
    case program
//    case service
//    case repertoire
//    case location
//    case personnel
    
    var navigationTitle: String {
        switch self {
        case .season:
            return "Season"
        case .program:
            return "Program"
        }
    }
    
    /// Determines the root view for each route
    @ViewBuilder var destination: some View {
        switch self {
        case .season:
            SeasonRootView()
        case .program:
            ProgramView()
        }
    }
}

struct SeasonNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.seasonRoutes) {
            SeasonRootView()
                .primaryToolbar(signedInState: state)
        }
    }
}


struct ProgramView: View {
    
    var body: some View {
        VStack {
            Text("Program View")
        }
    }
}
