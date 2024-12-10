//
//  DashboardRootView.swift
//  ensemble
//
//  Created by Spencer Jones on 12/9/24.
//

import Foundation
import SwiftUI

struct DashboardRootView: View {
    
    @Environment(Router.self) private var router
    
    let currentProgram = Program()
    
    @State private var selectedSheet: InfoButton?
    
    var body: some View {
        VStack {
            VStack {
                welcomeMessage
                /// could this be a carousel of every week????
                programCard
            }
        }
        .background(Color.background)
        .padding()
        .sheet(item: $selectedSheet) { sheet in
            switch sheet {
            case .dress:
                Text("Dress Code: \(currentProgram.dress.name)")
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            case .location:
                Text("Location: \(currentProgram.venueName)\n\(currentProgram.venueAddress)")
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            case .moreInfo:
                Text("More info sheet")
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
            }
        }
        
        
    }
    
    @ViewBuilder var welcomeMessage: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(
                gradient: Gradient(colors: [.alwaysAccentDark, Color.alwaysAccentLight]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
            .overlay(
                VStack(alignment: .leading) {
                    Text("Good Morning Spencer.")
                    Text("Here's what's coming up:")
                }
                .foregroundStyle(Color.white)
                .font(.title2)
                .fontWeight(.semibold)
            )
            .frame(height: 96)
    }
    
    @ViewBuilder var serviceList: some View {
        ForEach(currentProgram.services, id: \.id) { service in
            VStack() {
                HStack {
                    Text(service.day)
                    Spacer()
                    Text(service.time)
                }
                HStack {
                    Text(service.type)
                    Spacer()
                    Text(service.location)
                }
                if !(service == currentProgram.services.last) {
                    Divider()
                        .padding(4)
                }
            }
            .font(.caption2)
            .foregroundStyle(Color.white)
                
        }
    }
    
    @ViewBuilder var programCard: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.alwaysAccentDark.opacity(0.75))
            .overlay(
                VStack {
                    VStack(alignment: .leading) {
                        Text(currentProgram.id)
                            .font(.footnote)
                        Text(currentProgram.title)
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                        Text("\(currentProgram.conductor), conductor")
                            .font(.callout)
                    }
                    HStack(spacing: 24) {
                        repButton
                        infoButton(.dress)
                        infoButton(.location)
                        infoButton(.moreInfo)
                    }
                    .padding(.vertical, 16)
                    serviceList
                    
                }
                .padding(16)
                .foregroundStyle(Color.white.opacity(0.90))
                
            )
    }
    
    @ViewBuilder var repButton: some View {
        Button(action: {
            router.dashboardRoutes.append(.repertoire(currentProgram.repertoire))
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 48, height: 48)
                    .foregroundStyle(Color.alwaysAccentDark.opacity(0.75))
                Image(systemName: "music.note.list")
                }
            }
        )
        .navigationDestination(for: DashboardRoute.self) { route in
            route.destination
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(route.navigationTitle)
                
        }
    }
    
    @ViewBuilder func infoButton(_ type: InfoButton) -> some View {
        
            Button(action: {
                switch type {
                case .dress:
                    selectedSheet = .dress
                case .location:
                    selectedSheet = .location
                case .moreInfo:
                    selectedSheet = .moreInfo
                }
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color.alwaysAccentDark.opacity(0.75))
                    switch type {
                    case .dress:
                        Image(systemName: "tshirt")
                    case .location:
                        Image(systemName: "mappin.and.ellipse")
                    case .moreInfo:
                        Image(systemName: "info")
                    }
                }
                .font(.headline)
            })
        
        
    }
    
    enum InfoButton: Identifiable {
        case dress, location, moreInfo

        var id: InfoButton { self }
    }}

#Preview {
    DashboardRootView()
}

struct Program {
    var id = "LIVE05"
    var title = "Physicians Mutual Omaha Symphony Christmas Celebration 2024"
    var conductor = "Ernest Richardson"
    var guest = [
        "Yo-Yo Ma",
        "Lang Lang",
        "Gustavo Dudamel",
        "John Williams",
        "Esperanza Spalding"
    ]
    var repertoire = [
        Repertoire(composer: "Trad.", title: "Silent Night", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "Gruber", title: "Joy to the World", instrumentation: "3[1.2.pic]222 - 4331 T3 str"),
        Repertoire(composer: "Mendelssohn", title: "Hark! The Herald Angels Sing", instrumentation: "3[1.2]22[1.bcl]2 - 4332 -T4 hp cel [ebass, set] str"),
        Repertoire(composer: "Trad.", title: "O Holy Night", instrumentation: "3333 - 4331 1P str, timp"),
        Repertoire(composer: "Tchaikovsky", title: "Dance of the Sugar Plum Fairy", instrumentation: "3[1.2.pic]2+22 - 4331 timp, perc, hp, cel, str"),
        Repertoire(composer: "Anderson", title: "Sleigh Ride", instrumentation: "3333 - 4331 1P str, timp, perc"),
        Repertoire(composer: "Berlin", title: "White Christmas", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "Adam", title: "O Holy Night", instrumentation: "3333 - 4331 1P str, timp, hp"),
        Repertoire(composer: "Handel", title: "Hallelujah Chorus", instrumentation: "3[1.2.pic]22[1.bcl]2 - 4331 tmp, org, str"),
        Repertoire(composer: "Trad.", title: "The First Noel", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "Trad.", title: "Deck the Halls", instrumentation: "3222 - 4231 1P str"),
        Repertoire(composer: "Trad.", title: "We Wish You a Merry Christmas", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "Trad.", title: "Angels We Have Heard on High", instrumentation: "3222 - 4231 1P str, hp"),
        Repertoire(composer: "Cornelius", title: "The Three Kings", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "Holst", title: "In the Bleak Midwinter", instrumentation: "3333 - 4331 1P str, timp"),
        Repertoire(composer: "Rutter", title: "Angels' Carol", instrumentation: "2222 - 4231 1P str, hp"),
        Repertoire(composer: "Willcocks", title: "Ding Dong! Merrily on High", instrumentation: "3[1.2.pic]222 - 4331 timp, perc, str"),
        Repertoire(composer: "Bach", title: "Jesu, Joy of Man's Desiring", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "arr. David Willcocks", title: "O Come, All Ye Faithful", instrumentation: "3333 - 4331 1P str, org, timp"),
        Repertoire(composer: "Mozart", title: "Ave Verum Corpus", instrumentation: "2222 - 4231 1P str"),
        Repertoire(composer: "Trad.", title: "God Rest Ye Merry, Gentlemen", instrumentation: "3222 - 4231 1P str"),
        Repertoire(composer: "Whitacre", title: "Lux Aurumque", instrumentation: "3333 - 4331 1P str")
    ]
    var venueName = "Holland Performing Arts Center"
    var venueAddress = "1200 Douglas St., Omaha, NE 68102"
    var personnel: [String: String]?
    var dress: DressCode = .dressBlack
    var services: [Service] = [
        Service(day: "Tuesday, Dec 10", time: "7:00 PM - 9:30 PM", location: "HPAC", type: "Rehearsal - Various"),
        Service(day: "Wednesday, Dec 11", time: "7:00 PM - 9:30 PM", location: "HPAC", type: "Rehearsal - Various"),
        Service(day: "Thursday, Dec 12", time: "7:30 PM", location: "HPAC", type: "Performance"),
        Service(day: "Friday, Dec 13", time: "7:30 PM", location: "HPAC", type: "Performance"),
        Service(day: "Saturday, Dec 14", time: "2:00 PM", location: "HPAC", type: "Performance"),
        Service(day: "Saturday, Dec 14", time: "7:30 PM", location: "HPAC", type: "Performance"),
        Service(day: "Saturday, Dec 15", time: "2:00 PM", location: "HPAC", type: "Performance"),
        Service(day: "Sunday, Dec 15", time: "7:30 PM", location: "HPAC", type: "Performance")
    ]
}

struct Service: Equatable {
    var id = UUID()
    var day: String
    var time: String
    var location: String
    var type: String
}

enum DressCode {
    case dressBlack
    
    var name: String {
        switch self {
        case .dressBlack:
            return "Dress Black"
        }
    }
}

struct Repertoire: Hashable {
    var id = UUID()
    var composer: String
    var title: String
    var instrumentation: String
}





