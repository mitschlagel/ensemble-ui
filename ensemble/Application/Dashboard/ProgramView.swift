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
            ScrollView {
                header
                programTitle
                Rectangle().frame(height: 1)
                    .padding(.vertical, 8)
                    .opacity(0.33)
                services
                Rectangle().frame(height: 1)
                    .padding(.vertical, 8)
                    .opacity(0.33)
                dress
                Rectangle().frame(height: 1)
                    .padding(.vertical, 8)
                    .opacity(0.33)
                personnel
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity)
        .background(Gradients.programLargeGradient(program.id_color))
    }
    
    @ViewBuilder var programTitle: some View {
        VStack(alignment: .leading) {
            Text(program.id)
                .fontWeight(.semibold)
            HStack(alignment: .bottom) {
                Text(program.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 4)
                Spacer()
                Button(action: {
                    // TODO: download pdf
                }) {
                    Image("pdf")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32)
                }
            }
        }
        .font(.title2)
        .padding(.top, 4)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder var header: some View {
        HStack {
            Spacer()
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle") // Or a custom close icon
                    .opacity(0.5)
            }
            .font(.title2)
             // Add some padding around the button
        }
        .padding(.bottom, 8)
        
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
                .font(.callout)
                .padding(.bottom, 8)
            }
        }
        .padding(.horizontal, 16)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder var dress: some View {
        VStack(alignment: .leading) {
            sectionTitle("Dress")
            Text(program.dress.name)
                .font(.callout)
        }
        .padding(.horizontal, 16)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder var personnel: some View {
        VStack(alignment: .leading) {
            sectionTitle("Personnel")
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        musicianList(strings)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        musicianList(winds)
                        musicianList(brass)
                        musicianList(others)
                    }
                }
            
        }
        .padding(.horizontal, 16)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    @ViewBuilder func musicianList(_ section: [String]) -> some View {
        if let roster = program.personnel {
            VStack(alignment: .leading) {
                ForEach(section, id: \.self) { instrument in
                    Text("\(instrument) / \(roster.filter { $0.instrument == instrument}.count)")
                        .padding(.top, 4)
                        .padding(.top, 2)
                        .fontWeight(.bold)
                    ForEach(roster.filter { $0.instrument == instrument}) { musician in
                        Text(musician.name)
                    }
                }
            }
            .font(.callout)
        }
    }
    
    private var strings: [String] = ["Violin", "Viola", "Cello", "Bass"]
    private var winds: [String] = ["Flute", "Oboe", "Clarinet", "Bassoon"]
    private var brass: [String] = ["Horn", "Trumpet", "Trombone", "Tuba"]
    private var others: [String] = ["Timpani", "Percussion", "Harp", "Keyboard"]

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
                    .fontWeight(.bold)
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
