//
//  ProgramView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/21/24.
//

import SwiftUI

struct ProgramView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isExpanded = false
    
    var program: Program
    
    init(_ program: Program) {
        self.program = program
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            header
            Text(program.title)
                .font(.title2)
                .fontWeight(.bold)
            services
            Rectangle().frame(width: 375, height: 1)
                .padding(.vertical, 8)
            dress
            Rectangle().frame(width: 375, height: 1)
                .padding(.vertical, 8)
            personnel
            Spacer()
        }
        .padding()
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity)
        .background(Gradients.programLargeGradient(program.id_color))
    }
    
    @ViewBuilder var header: some View {
        HStack {
            Text(program.id)
                .fontWeight(.semibold)
            Spacer()
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle") // Or a custom close icon
                    .font(.title2)
            }
            .padding() // Add some padding around the button
        }
    }
    
    @ViewBuilder func sectionTitle(_ title: String) -> some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 8)
            Spacer()
        }
    }
    
    @ViewBuilder var services: some View {
        VStack(alignment: .leading) {
            sectionTitle("Services")
            ForEach(program.services, id: \.id) { service in
                VStack(alignment: .leading) {
                    HStack {
                        Text(service.day)
                        Text(service.time)
                        Text(service.type)
                    }
                    Text(service.location)
                    Text(service.type)
                }
                .padding(.bottom, 8)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder var dress: some View {
        VStack(alignment: .leading) {
            sectionTitle("Dress")
            Text(program.dress.name)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder var personnel: some View {
        VStack(alignment: .leading) {
            sectionTitle("Personnel")
            ScrollView {
                if let roster = program.personnel {
                    OrchestraRosterView(roster)
                }
               
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct OrchestraRosterView: View {
    

    let musicians: [Musician]

    init(_ musicians: [Musician]) {
        self.musicians = musicians
    }
    
    var body: some View {
        ForEach(groupMusiciansBySection().keys.sorted(), id: \.self) { section in
            Section(header: HStack {
                Text(section)
                Spacer()
            }
                .padding(.vertical, 4)) {
                ForEach(groupMusiciansBySection()[section]!) { musician in
                    HStack {
                        Text(musician.name)
                        Spacer()
                    }
                }
            }
        }
    }

    func groupMusiciansBySection() -> [String: [Musician]] {
        return Dictionary(grouping: musicians, by: { $0.instrument })
    }
}

#Preview {
    ProgramView(Program.programs.first!)
}
