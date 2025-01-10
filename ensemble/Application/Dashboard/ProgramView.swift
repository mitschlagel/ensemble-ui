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
        VStack(alignment: .leading) {
            header
            Text(program.title)
                .font(.title2)
                .padding(.bottom, 8)
                .fontWeight(.bold)
            services
            Divider()
            
//            RoundedRectangle(cornerRadius: 8)
//                .fill(.ultraThinMaterial)
//                .overlay {
//                    ForEach(program.services, id: \.id) { service in
//                        VStack {
//                            HStack {
//                                Text(service.day)
//                                Text(service.time)
//                                Text(service.type)
//                            }
//                            HStack {
//                                Text(service.location)
//                                Text(service.type)
//                            }
//                        }
//                    }
//                }
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
}

struct CollapsibleSection<Content: View>: View {
    var title: String
    @Binding var isExpanded: Bool
    var content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    Text(title)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(isExpanded ? .degrees(0) : .degrees(90))
                }
            }
            .font(.title3)
            if isExpanded {
                content()
            }
        }
    }
}

#Preview {
    ProgramView(Program.programs.first!)
}
