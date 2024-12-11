//
//  ensembleApp.swift
//  ensemble
//
//  Created by Spencer Jones on 12/2/24.
//

import SwiftUI

import Amplify
import AWSCognitoAuthPlugin

@main
struct ensembleApp: App {
    
    init() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure(with: .amplifyOutputs)
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
        
        setNavBarAppearance()
        setTabBarAppearence()
       
    }

    var body: some Scene {
        WindowGroup {
            LoginScreen()
        }
    }
    
    private func setNavBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.background)
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func setTabBarAppearence() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.shadowColor = .clear
        tabBarAppearance.backgroundColor = UIColor(Color.background)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
