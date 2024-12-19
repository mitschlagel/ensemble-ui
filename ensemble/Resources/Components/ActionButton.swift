//
//  ActionButton.swift
//  ensemble
//
//  Created by Spencer Jones on 12/18/24.
//

import SwiftUI

enum ActionButtonType: Identifiable {
    case rep, services, location, info
    var id: ActionButtonType { self }
}
struct ActionButton: View {
    
    var type: ActionButtonType
    var program: Program
    var action: ()->Void
    
    init(_ type: ActionButtonType, _ program: Program, _ action: @escaping () -> Void) {
        self.type = type
        self.program = program
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 44, height: 44)
                    .foregroundStyle(program.id_color)
                switch type {
                case .rep:
                    Image(systemName: "music.note.list")
                case .services:
                    Image(systemName: "calendar")
                case .location:
                    Image(systemName: "mappin.and.ellipse")
                case .info:
                    Image(systemName: "info")
                }
                
            }
        })
        .navigationDestination(for: DashboardRoute.self) { route in
            route.destination
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(route.navigationTitle)
        }
    }
}
