//
//  SeasonAPI.swift
//  ensemble
//
//  Created by Spencer Jones on 12/10/24.
//
import SwiftUI

struct Season {
    var id: String
    var programs: [Program]
}

struct Program: Identifiable, Hashable {
    var id: String
    var id_color: Color
    var title: String
    var conductor: String
    var guest: [String]
    var repertoire: [Repertoire]
    var venueName: String
    var venueAddress: String
    var personnel: [String: String]?
    var dress: DressCode
    var services: [Service]
    
    public static let program1 = Program(
        id: "LIVE05",
        id_color: Color.alwaysAccentDark,
        title: "Physicians Mutual Omaha Symphony Christmas Celebration 2024",
        conductor: "Ernest Richardson",
        guest: [
            "Yo-Yo Ma",
            "Lang Lang",
            "Gustavo Dudamel",
            "John Williams",
            "Esperanza Spalding"
        ],
        repertoire: [
            Repertoire(composer: "Trad.", title: "Silent Night", instrumentation: "2222 - 4231 1P str"),
            Repertoire(composer: "Gruber", title: "Joy to the World", instrumentation: "3[1.2.pic]222 - 4331 T3 str"),
            Repertoire(composer: "Mendelssohn", title: "Hark! The Herald Angels Sing", instrumentation: "3[1.2]22[1.bcl]2 - 4332 -T4 hp cel [ebass, set] str"),
            Repertoire(composer: "Trad.", title: "O Holy Night", instrumentation: "3333 - 4331 1P str, timp"),
            Repertoire(composer: "Tchaikovsky", title: "Dance of the Sugar Plum Fairy", instrumentation: "3[1.2.pic]2+22 - 4331 timp, perc, hp, cel, str"),
            Repertoire(composer: "Anderson", title: "Sleigh Ride", instrumentation: "3333 - 4331 1P str, timp, perc"),
            Repertoire(composer: "Berlin", title: "White Christmas", instrumentation: "2222 - 4231 1P str"),
            Repertoire(composer: "Adam", title: "O Holy Night", instrumentation: "3333 - 4331 1P str, timp, hp"),
            Repertoire(composer: "Handel", title: "Hallelujah Chorus", instrumentation: "3[1.2.pic]22[1.bcl]2 - 4331 tmp, org, str")
        ],
        venueName: "Holland Performing Arts Center",
        venueAddress: "1200 Douglas St., Omaha, NE 68102",
        personnel: nil, // Or provide a dictionary if needed
        dress: .dressBlack,
        services: [
            Service(day: "Tuesday, Dec 10", time: "7:00 PM - 9:30 PM", location: "HPAC", type: "Rehearsal - Various"),
            Service(day: "Wednesday, Dec 11", time: "7:00 PM - 9:30 PM", location: "HPAC", type: "Rehearsal - Various"),
            Service(day: "Thursday, Dec 12", time: "7:30 PM", location: "HPAC", type: "Performance"),
            Service(day: "Friday, Dec 13", time: "7:30 PM", location: "HPAC", type: "Performance"),
            Service(day: "Saturday, Dec 14", time: "2:00 PM", location: "HPAC", type: "Performance"),
            Service(day: "Saturday, Dec 14", time: "7:30 PM", location: "HPAC", type: "Performance"),
            Service(day: "Saturday, Dec 15", time: "2:00 PM", location: "HPAC", type: "Performance"),
            Service(day: "Sunday, Dec 15", time: "7:30 PM", location: "HPAC", type: "Performance")
        ]
    )
    
    public static let program2 = Program(
        id: "CLASSICS02",
        id_color: Color.programAlt1,
        title: "Beethoven's Emperor Concerto",
        conductor: "Carlos Miguel Prieto",
        guest: [
            "Yefim Bronfman", // Pianist
        ],
        repertoire: [
            Repertoire(composer: "Mozart", title: "Overture to Don Giovanni", instrumentation: "2222 - 2200 - timp - str"),
            Repertoire(composer: "Beethoven", title: "Piano Concerto No. 5 in E-flat major, Op. 73 \"Emperor\"", instrumentation: "2222 - 2200 - timp - str"),
            Repertoire(composer: "Brahms", title: "Symphony No. 1 in C minor, Op. 68", instrumentation: "2222 - 4230 - timp - str")
        ],
        venueName: "Carnegie Hall",
        venueAddress: "881 7th Ave, New York, NY 10019",
        personnel: nil,
        dress: .dressBlack,
        services: [
            Service(day: "Friday, Jan 10", time: "10:00 AM - 12:00 PM", location: "Carnegie Hall", type: "Rehearsal - Mozart & Beethoven"),
            Service(day: "Saturday, Jan 11", time: "10:00 AM - 12:30 PM", location: "Carnegie Hall", type: "Rehearsal - Brahms"),
            Service(day: "Sunday, Jan 12", time: "2:00 PM", location: "Carnegie Hall", type: "Performance")
        ]
    )

    public static let program3 = Program(
        id: "POPS01",
        id_color: Color.programAlt2,
        title: "A Night at the Movies",
        conductor: "Thomas Wilkins",
        guest: [
            "Cynthia Erivo", // Singer and actress
        ],
        repertoire: [
            Repertoire(composer: "John Williams", title: "Suite from Star Wars", instrumentation: "3[1.2.pic]2+22 - 4331 - timp, perc, hp, str"),
            Repertoire(composer: "Hans Zimmer", title: "Suite from The Lion King", instrumentation: "3[1.2.pic]2+22 - 4331 - timp, perc, hp, str"),
            Repertoire(composer: "Alan Menken", title: "Selections from Beauty and the Beast", instrumentation: "3[1.2.pic]2+22 - 4331 - timp, perc, hp, str")
        ],
        venueName: "Symphony Hall",
        venueAddress: "301 Massachusetts Ave, Boston, MA 02115",
        personnel: nil,
        dress: .dressBlack,
        services: [
            Service(day: "Thursday, Feb 20", time: "7:00 PM - 9:30 PM", location: "Symphony Hall", type: "Rehearsal"),
            Service(day: "Friday, Feb 21", time: "7:00 PM - 9:00 PM", location: "Symphony Hall", type: "Sound Check"),
            Service(day: "Saturday, Feb 22", time: "8:00 PM", location: "Symphony Hall", type: "Performance")
        ]
    )
    
    public static let program4 = Program(
        id: "CHAMBER03",
        id_color: Color.programAlt3,
        title: "An Evening of Schubert and Brahms",
        conductor: "Billy Bob Thornton", // No conductor for this chamber music program
        guest: [
            "Pinchas Zukerman", // Violinist
            "Amanda Forsyth", // Cellist
            "Angela Hewitt", // Pianist
        ],
        repertoire: [
            Repertoire(composer: "Schubert", title: "Piano Trio No. 1 in B-flat major, D. 898", instrumentation: "Violin, cello, piano"),
            Repertoire(composer: "Brahms", title: "Piano Quartet No. 1 in G minor, Op. 25", instrumentation: "Violin, viola, cello, piano")
        ],
        venueName: "Alice Tully Hall",
        venueAddress: "1941 Broadway, New York, NY 10023",
        personnel: nil,
        dress: .dressBlack,
        services: [
            Service(day: "Wednesday, March 5", time: "1:00 PM - 3:00 PM", location: "Alice Tully Hall", type: "Rehearsal"),
            Service(day: "Thursday, March 6", time: "7:30 PM", location: "Alice Tully Hall", type: "Performance")
        ]
    )

}


struct Service: Equatable, Hashable {
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

struct Repertoire: Identifiable, Hashable {
    var id = UUID()
    var composer: String
    var title: String
    var instrumentation: String
}
