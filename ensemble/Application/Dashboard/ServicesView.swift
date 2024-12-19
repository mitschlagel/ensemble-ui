//
//  ServicesView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/18/24.
//

import SwiftUI

struct ServicesView: View {
    
    var program: Program
    @State private var showingInfoSheet: Bool = false
    @State private var selectedService: Service?
    
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
                            showInfoSheet(for: service)
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
        .sheet(isPresented: $showingInfoSheet) {
            Text(selectedService?.type ?? "")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        
    }
    
    private func showInfoSheet(for service: Service) {
        selectedService = service
        showingInfoSheet = true
    }
}

#Preview {
    ServicesView(program: Ensemble.fake1.programs.first!)
}
