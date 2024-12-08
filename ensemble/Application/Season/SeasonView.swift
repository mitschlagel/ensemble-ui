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
    
    @ViewBuilder var destination: some View {
        switch self {
        case .season:
            Text("Season View")
        case .program:
            Text("Program View")
        }
    }
}

struct SeasonNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.seasonRoutes) {
            VStack {
                Text("Season View")
                Button("Sign out") {
                    Task {
                        await state.signOut()
                    }
                }
            }
        }
    }
}


//    .toolbar {
//        ToolbarItem(placement: .topBarTrailing) {
//            Menu {
//                Button("Sign out") {
//                    Task {
//                        await state.signOut()
//                    }
//                }
//            } label: {
//                Label("Menu", systemImage: "person.fill")
//            }
//        }
//    }
