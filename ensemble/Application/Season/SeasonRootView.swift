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
        .onAppear {
            let dates = getDates(from: Program.programs)
            print(dates)
        }
    }
    
    private func getDate(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        if let date = dateFormatter.date(from: string) {
            return date
        }
        return nil
    }
    
    private func getDates(from programs: [Program]) -> [Date] {
        var dates: [Date] = []
        for program in programs {
            for service in program.services {
                if let date = service.date {
                    dates.append(date)
                }
            }
        }
        return dates
    }
}

#Preview {
    SeasonRootView()
}
