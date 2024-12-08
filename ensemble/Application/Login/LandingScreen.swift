//
//  LandingScreen.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//

import SwiftUI

import Authenticator

struct LandingScreen: View {
    
    var state: SignedInState
    
    init(_ state: SignedInState) {
        self.state = state
    }
    
    var body: some View {
        VStack {
            Button("Sign out") {
                Task {
                    await state.signOut()
                }
            }
        }
    }
}

