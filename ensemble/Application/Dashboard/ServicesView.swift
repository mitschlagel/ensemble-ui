//
//  ServicesView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/18/24.
//

import SwiftUI

struct ServicesView: View {
    
    var program: Program
    
    var body: some View {
        VStack {
            VStack {
                ForEach(program.services) { service in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(service.day)
                            Text(service.type)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text(service.time)
                            Text(service.location)
                        }
                        Spacer()
                        ActionButton(.info, program) {
                            //TODO: show something
                        }
                    }
                    .padding()
                    .foregroundStyle(Color.white)
                    .font(.caption)
                    .background(Gradients.programRadialGradient(program.id_color))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.background)
        
    }
}

#Preview {
    ServicesView(program: Ensemble.fake1.programs.first!)
}
