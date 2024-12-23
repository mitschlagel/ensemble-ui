//
//  SeasonRootView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/9/24.
//

import UIKit
import SwiftUI
import Foundation

import Authenticator

struct SeasonRootView: View {
    
    @Environment(Router.self) private var router
    
    var body: some View {
        VStack {
            CalendarView()
                .environment(\.locale, .init(identifier: "en"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
    private func getDate(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        if let date = dateFormatter.date(from: string) {
            return date
        }
    }
    
    private func getDates() {
        
    }
}

#Preview {
    SeasonRootView()
}
