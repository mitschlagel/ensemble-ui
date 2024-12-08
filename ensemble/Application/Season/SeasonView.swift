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
            SeasonView()
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
            VStack {
                Button("View Program Detail") {
                    router.seasonRoutes.append(.program)
                }
                .navigationDestination(for: SeasonRoute.self) { route in
                    route.destination
                        .environmentObject(state)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle(route.navigationTitle)
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Menu {
                                    Button("Sign out") {
                                        Task {
                                            await state.signOut()
                                        }
                                    }
                                } label: {
                                    Label("Menu", systemImage: "line.3.horizontal")
                                }
                            }
                        }
                }
            }
            .navigationTitle("Season")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Sign out") {
                            Task {
                                await state.signOut()
                            }
                        }
                    } label: {
                        Label("Menu", systemImage: "line.3.horizontal")
                    }
                }
            }
        }
    }
}

struct SeasonView: View {
    
    var body: some View {
        Text("Season View")
    }
}

struct ProgramView: View {
    
    var body: some View {
        VStack {
            Text("Program View")
        }
    }
}
