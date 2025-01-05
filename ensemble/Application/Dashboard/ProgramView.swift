//
//  ProgramView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/21/24.
//

import SwiftUI

struct ProgramView: View {
    
    var program: Program
    
    init(_ program: Program) {
        self.program = program
    }
    
    var body: some View {
        Text(program.title)
    }
}

//#Preview {
//    ProgramView(Program.program1)
//}
