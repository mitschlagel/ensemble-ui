//
//  LoginViewModel.swift
//  ensemble
//
//  Created by Spencer Jones on 12/7/24.
//
import SwiftUI

import Authenticator

class AuthManager: ObservableObject {
    
    @Published var state: SignedInState
    
    init(state: SignedInState) {
        self.state = state
    }
}
