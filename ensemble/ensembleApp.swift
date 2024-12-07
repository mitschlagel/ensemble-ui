//
//  ensembleApp.swift
//  ensemble
//
//  Created by Spencer Jones on 12/2/24.
//

import SwiftUI

import Amplify
import AWSAPIPlugin
import AWSCognitoAuthPlugin

@main
struct ensembleApp: App {
    
    init() {
        let awsApiPlugin = AWSAPIPlugin(modelRegistration: AmplifyModels())
        do {
            try Amplify.add(plugin: awsApiPlugin)
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure(with: .amplifyOutputs)
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            LoginScreen()
        }
    }
}