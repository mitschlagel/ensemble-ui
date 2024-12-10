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
        List {
            ForEach(repertoire, id: \.id) { piece in
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(piece.composer)
                        Text(piece.title)
                    }
                    .font(.footnote)
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(piece.instrumentation)
                            .font(.caption2)
                    }
                    
                }
            }
        }
    }
}
