//
//  SeasonRootView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/9/24.
//

import SwiftUI
import Authenticator

struct SeasonRootView: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            Button("View Program Detail") {
                router.seasonRoutes.append(.program)
            }
            .navigationDestination(for: SeasonRoute.self) { route in
                route.destination
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle(route.navigationTitle)
                    
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    SeasonRootView()
}
