//
//  RepertoireView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/10/24.
//

import SwiftUI

struct RepertoireView: View {
    
    var repertoire: [Repertoire]
    
    var body: some View {
        VStack {
            List {
                ForEach(repertoire) { piece in
                    VStack(spacing: 16) {
                        HStack {
                            Text(piece.title)
                                .fontWeight(.semibold)
                            Spacer()
                            Text(piece.composer)
                        }
                        .font(.subheadline)
                        HStack {
                            Text(piece.instrumentation)
                            Spacer()
                        }
                        .font(.footnote)
                        
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.grouped)
            Spacer()
        }
        .background(Color.background)
        
        
    }
}
#Preview {
    RepertoireView(repertoire: Program.program1.repertoire)
        
}
