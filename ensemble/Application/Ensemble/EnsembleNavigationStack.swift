//
//  ProfileNavigationStack.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

enum EnsembleRoute: Hashable {
    case ensembleRoot
    case detail(String)
    
    @ViewBuilder var destination: some View {
        switch self {
        case .ensembleRoot:
            Text("Ensemble Route")
        case .detail(let detail):
            Text("Ensemble \(detail) Route")
        }
    }
}

struct EnsembleNavigationStack: View {
    
    @Environment(Router.self) private var router
    
    @EnvironmentObject var state: SignedInState
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.ensembleRoutes) {
            EnsembleRootView()
                .primaryToolbar(signedInState: state)
        }
    }
}
