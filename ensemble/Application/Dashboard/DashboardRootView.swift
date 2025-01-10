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
    
    @State var programs = Program.programs
    @State var selectedProgram: Program?
    @State var programIndex: Int = 0
    @State private var actionSheet: ActionButtonType?
    @State private var showingInfoSheet = false
    
    var body: some View {
        VStack {
            welcomeMessage
            // programCarousel(programs)
            programStack(programs)
//            footerContainer(for: selectedProgram)
//                .padding(.horizontal, 16)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        .sheet(isPresented: $showingInfoSheet) {
            TabView(selection: $programIndex) {
                ForEach(Array(programs.enumerated()), id: \.offset) { index, program in
                    ProgramView(program)
                        .tag(index)
                }
            }
            .ignoresSafeArea()
            .presentationDragIndicator(.visible)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    
    @ViewBuilder func programStack(_ programs: [Program]) -> some View {
        ScrollView {
            VStack {
                ForEach(programs, id: \.id) { program in
                    programCard(program)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            // router.dashboardRoutes.append(.program(program))
                            selectedProgram = program
                            programIndex = programs.firstIndex(where: {$0.id == program.id}) ?? 0
                            showingInfoSheet = true
                        }
                        .shadow(radius: 5, x: 5, y: 5)
                        .padding(.vertical, 8)
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .scrollTransition { content, phase in
                            content.opacity(phase.isIdentity ? 1 : 0.2)
                        }
                }
            }
        }
        .padding(.top, -16)
    }
    
    @ViewBuilder func programCarousel(_ programs: [Program]) -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(programs, id: \.id) { program in
                    programCard(program)
                        .shadow(radius: 5, x: 5, y: 5)
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0.75)
                                .scaleEffect(y: phase.isIdentity ? 1 : 0.8)
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
            Text("\(greeting), Spencer.")
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
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
                .overlay {
                    VStack {
                        HStack {
                            Text("More information about the program potentially.")
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .padding(16)
                .foregroundStyle(Color.white)
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
    
    @ViewBuilder func programCard(_ program: Program) -> some View {
        
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    Text(program.id)
                        .fontWeight(.bold)
                    Text("\(program.startDate) \(program.endDate != nil ? "-" : "") \(program.endDate ?? "")")
                }
                .font(.footnote)
                .padding(.bottom, 8)
                VStack(alignment: .leading) {
                    Text(program.title)
                        .font(.headline)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                Text("\(program.conductor), conductor")
                    .font(.footnote)
                ForEach(program.guest, id: \.self) { guest in
                    Text(guest).font(.caption)
                }
            }
            .padding(.trailing, 16)
            Spacer()
//            VStack(spacing: 16) {
//                ActionButton(.rep, program) {
//                    router.dashboardRoutes.append(.repertoire(program.repertoire))
//                }
//                ActionButton(.services, program) {
//                    router.dashboardRoutes.append(.services(program))
//                }
//                ActionButton(.info, program) {
//                    actionSheet = .info
//                }
//            }
        }
        .padding(16)
        .foregroundStyle(Color.white)
        .background(Gradients.programRadialGradient(program.id_color))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    DashboardRootView()
}









