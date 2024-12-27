//
//  EnsembleRootView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/9/24.
//

import SwiftUI

struct EnsembleRootView: View {
    var body: some View {
        Grid(alignment: .topLeading, horizontalSpacing: 16, verticalSpacing: 16) {
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        VStack {
                            Text("Personnel Directory")
                            Spacer()
                        }
                        .foregroundStyle(Color.primaryText)
                        .padding()
                    }
                    .frame(width: 180, height: 180)
                RoundedRectangle(cornerRadius: 8)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        VStack {
                            Text("Master Agreement")
                            Spacer()
                        }
                        .foregroundStyle(Color.primaryText)
                        .padding()
                    }
                    .frame(width: 180, height: 180)
            }
            GridRow {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        VStack {
                            Text("Dress Code")
                            Spacer()
                        }
                        .foregroundStyle(Color.primaryText)
                        .padding()
                    }
                    .frame(width: 180, height: 180)
                RoundedRectangle(cornerRadius: 8)
                    .fill(.ultraThinMaterial)
                    .overlay {
                        VStack {
                            Text("Venues")
                            Spacer()
                        }
                        .foregroundStyle(Color.primaryText)
                        .padding()
                    }
                    .frame(width: 180, height: 180)
            }
            Spacer()
            
        }
        .padding()
        .background(Color.background)
    }
}

#Preview {
    EnsembleRootView()
}
