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
                }
                .padding()
                .foregroundStyle(Color.white)
                .font(.callout)
                .background(program.id_color.opacity(0.6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            Spacer()
        }
        .background(Color.background)
        .padding()
        
    }
}

#Preview {
    ServicesView(program: Ensemble.fake1.programs.first!)
}
