//
//  ProgramView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/21/24.
//

import SwiftUI

struct ProgramView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var program: Program
    
    init(_ program: Program) {
        self.program = program
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill") // Or a custom close icon
                        .font(.title2)
                }
                .padding() // Add some padding around the button
            }
            Text(program.title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .foregroundStyle(Color.white)
        .frame(maxWidth: .infinity)
        .background(Gradients.programLargeGradient(program.id_color))
    }
}

//#Preview {
//    ProgramView(Program.program1)
//}
