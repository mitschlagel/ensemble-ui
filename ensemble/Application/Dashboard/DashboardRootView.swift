//
//  DashboardRootView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/9/24.
//

import Foundation
import SwiftUI

import ShuffleIt

struct DashboardRootView: View {
    
    @Environment(Router.self) private var router
    
    @State var programs = [Program.program1, Program.program2, Program.program3, Program.program4]
    @State var selectedProgram: Program?
    @State var programIndex: Int = 0
    @State private var selectedSheet: InfoButton?
    
    var body: some View {
        VStack {
            VStack {
                welcomeMessage
                /// could this be a carousel of every week????
                CarouselStack(programs, initialIndex: 0) { program in
                    programCard(program)
                }
                .carouselScale(0.9)
                
            }
            Spacer()
        }
        .background(Color.background)
        .padding()
        .sheet(item: $selectedSheet) { sheet in
            switch sheet {
            case .dress:
                Text("Dress Code: \(selectedProgram?.dress.name ?? "")")
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            case .location:
                Text("Location: \(selectedProgram?.venueName ?? "")\n\(selectedProgram?.venueAddress ?? "")")
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            case .moreInfo:
                Text("More info sheet")
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
    }
    
    @ViewBuilder var welcomeMessage: some View {
//        RoundedRectangle(cornerRadius: 8)
//            .fill(LinearGradient(
//                gradient: Gradient(colors: [.alwaysAccentDark, Color.alwaysAccentLight]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            ))
//            .overlay(
//                VStack(alignment: .leading) {
                    Text("Good Morning, here's what's coming up:")
//                }
            .foregroundStyle(Color.primaryText)
                .font(.headline)
                .fontWeight(.semibold)
            //)
            .frame(height: 56)
    }
    
    @ViewBuilder func serviceList(_ program: Program) -> some View {
        ForEach(program.services, id: \.id) { service in
            VStack() {
                HStack {
                    Text(service.day)
                    Spacer()
                    Text(service.time)
                }
                HStack {
                    Text(service.type)
                    Spacer()
                    Text(service.location)
                }
                if !(service == program.services.last) {
                    Divider()
                        .padding(4)
                }
            }
            .font(.caption2)
            .foregroundStyle(Color.white)
                
        }
    }
    
    @ViewBuilder func programCard(_ program: Program) -> some View {
        
        let radialGrandient = RadialGradient(
            gradient: Gradient(colors: [program.id_color, program.id_color.opacity(0.50)]),
            center: .bottomLeading,
            startRadius: 0,
            endRadius: 500
        )

        VStack {
            VStack(alignment: .leading) {
                Text(program.id)
                    .font(.footnote)
                Text(program.title)
                    .font(.headline)
                Text("\(program.conductor), conductor")
                    .font(.callout)
            }
            HStack(spacing: 24) {
                repButton(program)
                infoButton(.dress, program)
                infoButton(.location, program)
                infoButton(.moreInfo, program)
            }
            .padding(.vertical, 16)
            serviceList(program)
            Spacer()
        }
        .padding(16)
        .foregroundStyle(Color.white)
        .background(radialGrandient)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder func repButton(_ program: Program) -> some View {
        Button(action: {
            router.dashboardRoutes.append(.repertoire(program.repertoire))
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(program.id_color)
                Image(systemName: "music.note.list")
                }
            }
        )
        .navigationDestination(for: DashboardRoute.self) { route in
            route.destination
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(route.navigationTitle)
                
        }
    }
    
    @ViewBuilder func infoButton(_ type: InfoButton, _ program: Program) -> some View {
        
            Button(action: {
                switch type {
                case .dress:
                    selectedSheet = .dress
                case .location:
                    selectedSheet = .location
                case .moreInfo:
                    selectedSheet = .moreInfo
                }
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(program.id_color)
                    switch type {
                    case .dress:
                        Image(systemName: "tshirt")
                    case .location:
                        Image(systemName: "mappin.and.ellipse")
                    case .moreInfo:
                        Image(systemName: "info")
                    }
                }
                .font(.headline)
            })
        
        
    }
    
    enum InfoButton: Identifiable {
        case dress, location, moreInfo

        var id: InfoButton { self }
    }}

#Preview {
    DashboardRootView()
}

struct Service: Equatable, Hashable {
    var id = UUID()
    var day: String
    var time: String
    var location: String
    var type: String
}

enum DressCode {
    case dressBlack
    
    var name: String {
        switch self {
        case .dressBlack:
            return "Dress Black"
        }
    }
}

struct Repertoire: Hashable {
    var id = UUID()
    var composer: String
    var title: String
    var instrumentation: String
}







