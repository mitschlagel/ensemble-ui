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
    @State private var selectedSheet: SheetButton?
    
    var body: some View {
        VStack {
            welcomeMessage
            programCarousel(programs)
            footerContainer(for: selectedProgram)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        .sheet(item: $selectedSheet) { sheet in
            switch sheet {
            case .services:
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
    
    @ViewBuilder func programCarousel(_ programs: [Program]) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(programs, id: \.id) { program in
                    programCard(program)
                        .shadow(radius: 5, x: 5, y: 5)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 500)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.75)
                                .scaleEffect(y: phase.isIdentity ? 1 : 0.8
                                )
                        }
                }
            }
            .scrollTargetLayout()
        }
        .padding(.top, -16)
        .scrollIndicatorsFlash(onAppear: true)
        .contentMargins(16, for: .scrollContent) // Add padding
        .scrollTargetBehavior(.viewAligned)
    }
    
    @ViewBuilder var welcomeMessage: some View {
        HStack {
            Text("\(greeting), here's what's coming up:")
            Spacer()
        }
        .padding(.horizontal, 16)
        .foregroundStyle(Color.primaryText)
        .font(.headline)
        .fontWeight(.semibold)
        .frame(height: 56)
    }
    
    @ViewBuilder func footerContainer(for program: Program?) -> some View {
        if let program {
            VStack {
                HStack {
                    Text("More information about the program potentially.")
                    Spacer()
                }
                Spacer()
            }
            .padding(16)
            .foregroundStyle(Color.white)
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [program.id_color, program.id_color.opacity(0.6)]),
                    center: .bottomLeading,
                    startRadius: 0,
                    endRadius: 250
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        default: return "Good Evening"
        }
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
                        .padding(2)
                }
            }
            .font(.caption2)
            .foregroundStyle(Color.white)
                
        }
    }
    
    @ViewBuilder func programCard(_ program: Program) -> some View {
        
//        let radialGrandient = RadialGradient(
//            gradient: Gradient(colors: [program.id_color, program.id_color.opacity(0.50)]),
//            center: .bottomLeading,
//            startRadius: 0,
//            endRadius: 500
//        )
        
        

        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(program.id)
                    .font(.footnote)
                Text(program.title)
                    .font(.headline)
                Text("\(program.conductor), conductor")
                    .font(.callout)
            }
            HStack(spacing: 24) {
                Spacer()
                navigationButton(.rep, program)
                navigationButton(.services, program)
                sheetButton(.location, program)
                sheetButton(.moreInfo, program)
                Spacer()
            }
            .padding()
            serviceList(program)
            Spacer()
            
        }
        .padding(16)
        .foregroundStyle(Color.white)
        .background(Gradients.programRadialGradient(program.id_color))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    
    @ViewBuilder func navigationButton(_ type: NavigationButton, _ program: Program) -> some View {
        Button(action: {
            switch type {
            case .rep:
                router.dashboardRoutes.append(.repertoire(program.repertoire))
            case .services:
                router.dashboardRoutes.append(.services(program))
            }
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(program.id_color)
                switch type {
                case .rep:
                    Image(systemName: "music.note.list")
                case .services:
                    Image(systemName: "calendar")
                }
                
                }
            }
        )
        .navigationDestination(for: DashboardRoute.self) { route in
            route.destination
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(route.navigationTitle)
                
        }
    }
    enum NavigationButton {
        case rep, services
    }
    
    @ViewBuilder func sheetButton(_ type: SheetButton, _ program: Program) -> some View {
        
            Button(action: {
                switch type {
                case .location:
                    selectedSheet = .location
                case .moreInfo:
                    selectedSheet = .moreInfo
                case .services:
                    selectedSheet = .services
                }
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(program.id_color)
                    switch type {
                    case .services:
                        Image(systemName: "calendar")
                    case .location:
                        Image(systemName: "mappin.and.ellipse")
                    case .moreInfo:
                        Image(systemName: "info")
                    }
                }
                .font(.headline)
            })
        
        
    }
    
    enum SheetButton: Identifiable {
        case services, location, moreInfo

        var id: SheetButton { self }
    }}

#Preview {
    DashboardRootView()
}









