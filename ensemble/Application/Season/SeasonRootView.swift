//
//  SeasonRootView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/9/24.
//

import UIKit
import SwiftUI
import Authenticator

struct SeasonRootView: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            Text("Season Root View")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    SeasonRootView()
}
