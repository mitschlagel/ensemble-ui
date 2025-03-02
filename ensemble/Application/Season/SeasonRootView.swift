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
    
    private let groupedPrograms: [[Program]]
    private let dateComponents: Set<DateComponents>
    
    init(programs: [Program] = Program.programs) {
        self.groupedPrograms = Self.groupProgramsByIdPrefix(programs: programs)
        self.dateComponents = Self.getDateComponents(from: Self.extractDates(from: programs))
    }
    
    var body: some View {
        VStack {
            CalendarView()
                .decorating(dateComponents, color: .green, size: .large)
                .environment(\.locale, .current)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
    // MARK: - Helper Methods
    
    private static func extractDates(from programs: [Program]) -> [Date] {
        programs.flatMap { program in
            program.services.compactMap(\.date)
        }
    }
    
    private static func getDateComponents(from dates: [Date]) -> Set<DateComponents> {
        let calendar = Calendar.current
        let components: [Calendar.Component] = [.year, .month, .day, .hour, .minute]
        
        return Set(dates.map { date in
            calendar.dateComponents(Set(components), from: date)
        })
    }
    
    private static func groupProgramsByIdPrefix(
        programs: [Program],
        prefixLength: Int = 2
    ) -> [[Program]] {
        let prefixGroups = Dictionary(
            grouping: programs,
            by: { String($0.id.prefix(prefixLength)) }
        )
        return Array(prefixGroups.values)
    }
}

// MARK: - Preview Provider
#Preview {
    SeasonRootView()
}
