//
//  MockEnsembleAPI.swift
//  ensemble
//
//  Created by Spencer Jones on 12/10/24.
//
import SwiftUI

struct Ensemble {
    var id: String
    var name: String
    var programs: [Program]
    
    public static var fake1: Ensemble {
        return Ensemble(id: "000001",
                        name: "Omaha Symphony Association",
                        programs: Program.programs)
    }
}

struct Musician: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let instrument: String
    let section: String
    
    public static let mock: [Musician] = [
        // Strings
        Musician(name: "Sophia Lee", instrument: "Violin", section: "Strings"),
        Musician(name: "Ethan Chen", instrument: "Violin", section: "Strings"),
        Musician(name: "Olivia Rodriguez", instrument: "Violin", section: "Strings"),
        Musician(name: "Noah Garcia", instrument: "Violin", section: "Strings"),
        Musician(name: "Ava Davis", instrument: "Violin", section: "Strings"),
        Musician(name: "Jackson Wilson", instrument: "Violin", section: "Strings"),
        Musician(name: "Isabella Martinez", instrument: "Violin", section: "Strings"),
        Musician(name: "Aiden Taylor", instrument: "Violin", section: "Strings"),
        Musician(name: "Mia Anderson", instrument: "Violin", section: "Strings"),
        Musician(name: "Liam Thomas", instrument: "Violin", section: "Strings"),
        Musician(name: "Emily Jackson", instrument: "Viola", section: "Strings"),
        Musician(name: "Jacob White", instrument: "Viola", section: "Strings"),
        Musician(name: "Abigail Harris", instrument: "Viola", section: "Strings"),
        Musician(name: "Michael Martin", instrument: "Viola", section: "Strings"),
        Musician(name: "Harper Thompson", instrument: "Viola", section: "Strings"),
        Musician(name: "Benjamin Garcia", instrument: "Viola", section: "Strings"),
        Musician(name: "Evelyn Martinez", instrument: "Viola", section: "Strings"),
        Musician(name: "Alexander Robinson", instrument: "Viola", section: "Strings"),
        Musician(name: "Avery Clark", instrument: "Viola", section: "Strings"),
        Musician(name: "Daniel Lewis", instrument: "Viola", section: "Strings"),
        Musician(name: "Sofia Hall", instrument: "Cello", section: "Strings"),
        Musician(name: "Matthew Young", instrument: "Cello", section: "Strings"),
        Musician(name: "Ella Allen", instrument: "Cello", section: "Strings"),
        Musician(name: "James Sanchez", instrument: "Cello", section: "Strings"),
        Musician(name: "Avery Wright", instrument: "Cello", section: "Strings"),
        Musician(name: "John King", instrument: "Cello", section: "Strings"),
        Musician(name: "Ellie Scott", instrument: "Cello", section: "Strings"),
        Musician(name: "Joseph Green", instrument: "Cello", section: "Strings"),
        Musician(name: "Scarlett Adams", instrument: "Cello", section: "Strings"),
        Musician(name: "Andrew Baker", instrument: "Cello", section: "Strings"),
        Musician(name: "Victoria Gonzalez", instrument: "Bass", section: "Strings"),
        Musician(name: "David Nelson", instrument: "Bass", section: "Strings"),
        Musician(name: "Grace Carter", instrument: "Bass", section: "Strings"),
        Musician(name: "Joseph Mitchell", instrument: "Bass", section: "Strings"),

        // Woodwinds
        Musician(name: "Lily Perez", instrument: "Flute", section: "Woodwinds"),
        Musician(name: "Henry Roberts", instrument: "Flute", section: "Woodwinds"),
        Musician(name: "Chloe Turner", instrument: "Oboe", section: "Woodwinds"),
        Musician(name: "Samuel Phillips", instrument: "Oboe", section: "Woodwinds"),
        Musician(name: "Addison Campbell", instrument: "Clarinet", section: "Woodwinds"),
        Musician(name: "Jack Parker", instrument: "Clarinet", section: "Woodwinds"),
        Musician(name: "Aubrey Evans", instrument: "Bassoon", section: "Woodwinds"),
        Musician(name: "David Collins", instrument: "Bassoon", section: "Woodwinds"),

        // Brass
        Musician(name: "Luke Stewart", instrument: "Trumpet", section: "Brass"),
        Musician(name: "Julian Sanchez", instrument: "Trumpet", section: "Brass"),
        Musician(name: "Grace Morris", instrument: "Horn", section: "Brass"),
        Musician(name: "Isaac Rogers", instrument: "Horn", section: "Brass"),
        Musician(name: "Caroline Reed", instrument: "Trombone", section: "Brass"),
        Musician(name: "Owen Cook", instrument: "Trombone", section: "Brass"),
        Musician(name: "Eleanor Bell", instrument: "Tuba", section: "Brass"),

        // Percussion
        Musician(name: "Miles Murphy", instrument: "Timpani", section: "Percussion"),
        Musician(name: "Theodore Bailey", instrument: "Percussion", section: "Percussion"),
        Musician(name: "Amelia Rivera", instrument: "Percussion", section: "Percussion")
    ]
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
    var personnel: [Musician]?
    var dress: DressCode
    var startDate: String
    var endDate: String?
    var services: [Service]
    
    public static let programs: [Program] = [
        Program(id: "MW1", id_color: .alwaysAccentDark, title: "Romantic Masterpieces", conductor: "Yannick Nézet-Séguin", guest: ["Hilary Hahn, violin"], repertoire: [Repertoire(composer: "Beethoven", title: "Symphony No. 5", instrumentation: "2222 - 4230 - timp - str"), Repertoire(composer: "Brahms", title: "Symphony No. 1", instrumentation: "2222 - 4230 - timp - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "August 3, 2024", endDate: "August 4, 2024", services: [Service(day: "Saturday, August 3", time: "10:00 AM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Sunday, August 4", time: "2:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "LIVE1", id_color: .programAlt1, title: "Beethoven & Brahms", conductor: "Gustavo Dudamel", guest: ["Lang Lang, piano"], repertoire: [Repertoire(composer: "Brahms", title: "Symphony No. 1", instrumentation: "2222 - 4230 - timp - str"), Repertoire(composer: "Beethoven", title: "Symphony No. 5", instrumentation: "2222 - 4230 - timp - str")], venueName: "The Orpheum Theater", venueAddress: "409 S 16th St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "August 18, 2024", endDate: "August 21, 2024", services: [Service(day: "Sunday, August 18", time: "11:00 AM", location: "The Orpheum Theater", type: "Rehearsal"), Service(day: "Wednesday, August 21", time: "7:30 PM", location: "The Orpheum Theater", type: "Performance")]),
        Program(id: "COM1", id_color: .programAlt2, title: "The Planets", conductor: "Sir Simon Rattle", guest: ["Joshua Bell, violin", "Yo-Yo Ma, cello"], repertoire: [Repertoire(composer: "Holst", title: "The Planets", instrumentation: "3333 - 4331 - timp, perc, hp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "September 1, 2024", endDate: "September 7, 2024", services: [Service(day: "Sunday, September 1", time: "1:00 PM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Saturday, September 7", time: "8:00 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW2", id_color: .alwaysAccentDark, title: "Symphonic Dances", conductor: "Marin Alsop", guest: ["Yuja Wang, piano"], repertoire: [Repertoire(composer: "Rachmaninoff", title: "Symphonic Dances", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "September 14, 2024", endDate: "September 15, 2024", services: [Service(day: "Saturday, September 14", time: "10:00 AM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Sunday, September 15", time: "2:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "JOS1", id_color: .programAlt3, title: "Violin Concerto in D Major", conductor: "Riccardo Muti", guest: ["Hilary Hahn, violin"], repertoire: [Repertoire(composer: "Brahms", title: "Violin Concerto in D Major", instrumentation: "2222 - 4230 - timp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "September 29, 2024", endDate: "October 2, 2024", services: [Service(day: "Sunday, September 29", time: "11:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, October 2", time: "7:30 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW3", id_color: .alwaysAccentDark, title: "American Voices", conductor: "Esa-Pekka Salonen", guest: ["Joyce DiDonato, mezzo-soprano"], repertoire: [Repertoire(composer: "Copland", title: "Appalachian Spring", instrumentation: "2222 - 2200 - str"), Repertoire(composer: "Bernstein", title: "Symphonic Dances from West Side Story", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "October 13, 2024", endDate: "October 16, 2024", services: [Service(day: "Sunday, October 13", time: "1:00 PM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, October 16", time: "8:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "COM2", id_color: .programAlt2, title: "Opera Highlights", conductor: "Andris Nelsons", guest: ["Renée Fleming, soprano"], repertoire: [Repertoire(composer: "Verdi", title: "Selections from La Traviata", instrumentation: "3333 - 4331 - timp, perc, hp - str"), Repertoire(composer: "Puccini", title: "Selections from Tosca", instrumentation: "3333 - 4331 - timp, perc, hp - str")], venueName: "The Orpheum Theater", venueAddress: "409 S 16th St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "October 27, 2024", endDate: "October 30, 2024", services: [Service(day: "Sunday, October 27", time: "10:00 AM", location: "The Orpheum Theater", type: "Rehearsal"), Service(day: "Wednesday, October 30", time: "2:00 PM", location: "The Orpheum Theater", type: "Performance")]),
        Program(id: "LIVE2", id_color: .programAlt1, title: "Mozart's Requiem", conductor: "Franz Welser-Möst", guest: [], repertoire: [Repertoire(composer: "Mozart", title: "Requiem", instrumentation: "222 - 4230 - timp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "November 10, 2024", endDate: "November 13, 2024", services: [Service(day: "Sunday, November 10", time: "11:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, November 13", time: "7:30 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW4", id_color: .alwaysAccentDark, title: "Baroque Classics", conductor: "Christian Thielemann", guest: ["Itzhak Perlman, violin"], repertoire: [Repertoire(composer: "Bach", title: "Brandenburg Concerto No. 3", instrumentation: "3300 - 0000 - str"), Repertoire(composer: "Vivaldi", title: "The Four Seasons", instrumentation: "3300 - 0000 - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "November 24, 2024", endDate: "November 27, 2024", services: [Service(day: "Sunday, November 24", time: "1:00 PM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, November 27", time: "8:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "JOS2", id_color: .programAlt3, title: "Holiday Celebration", conductor: "Mirga Gražinytė-Tyla", guest: ["Emanuel Ax, piano"], repertoire: [Repertoire(composer: "Tchaikovsky", title: "The Nutcracker Suite", instrumentation: "3222 - 4231 - timp, perc - str"), Repertoire(composer: "Anderson", title: "Sleigh Ride", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "December 8, 2024", endDate: "December 11, 2024", services: [Service(day: "Sunday, December 8", time: "10:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, December 11", time: "2:00 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW5", id_color: .alwaysAccentDark, title: "Piano Concerto No. 2", conductor: "Yannick Nézet-Séguin", guest: ["Lang Lang, piano"], repertoire: [Repertoire(composer: "Rachmaninoff", title: "Piano Concerto No. 2", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "December 22, 2024", endDate: "December 25, 2024", services: [Service(day: "Sunday, December 22", time: "11:00 AM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, December 25", time: "7:30 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "COM3", id_color: .programAlt2, title: "Cello Suites", conductor: "Andris Nelsons", guest: ["Yo-Yo Ma, cello"], repertoire: [Repertoire(composer: "Bach", title: "Cello Suites", instrumentation: "cello")], venueName: "The Orpheum Theater", venueAddress: "409 S 16th St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "December 29, 2024", endDate: "January 1, 2025", services: [Service(day: "Sunday, December 29", time: "1:00 PM", location: "The Orpheum Theater", type: "Rehearsal"), Service(day: "Wednesday, January 1", time: "8:00 PM", location: "The Orpheum Theater", type: "Performance")]),
        Program(id: "LIVE3", id_color: .programAlt1, title: "Chamber Music Masterworks", conductor: "Franz Welser-Möst", guest: ["Joshua Bell, violin", "Emanuel Ax, piano"], repertoire: [Repertoire(composer: "Brahms", title: "Piano Trio No. 1", instrumentation: "violin, cello, piano"), Repertoire(composer: "Schubert", title: "String Quartet No. 14 \"Death and the Maiden\"", instrumentation: "2 violins, viola, cello")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "January 12, 2025", endDate: "January 15, 2025", services: [Service(day: "Sunday, January 12", time: "10:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, January 15", time: "2:00 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW6", id_color: .alwaysAccentDark, title: "Opera Highlights", conductor: "Christian Thielemann", guest: ["Renée Fleming, soprano", "Joyce DiDonato, mezzo-soprano"], repertoire: [Repertoire(composer: "Mozart", title: "Selections from The Marriage of Figaro", instrumentation: "2222 - 2200 - str"), Repertoire(composer: "Wagner", title: "Selections from Die Walküre", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "January 26, 2025", endDate: "January 29, 2025", services: [Service(day: "Sunday, January 26", time: "11:00 AM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, January 29", time: "7:30 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "JOS3", id_color: .programAlt3, title: "Symphonic Dances", conductor: "Mirga Gražinytė-Tyla", guest: ["Yuja Wang, piano"], repertoire: [Repertoire(composer: "Dvořák", title: "Slavonic Dances", instrumentation: "2222 - 4230 - timp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "February 9, 2025", endDate: "February 12, 2025", services: [Service(day: "Sunday, February 9", time: "1:00 PM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, February 12", time: "8:00 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW7", id_color: .alwaysAccentDark, title: "Symphony No. 5", conductor: "Yannick Nézet-Séguin", guest: [], repertoire: [Repertoire(composer: "Shostakovich", title: "Symphony No. 5", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "February 23, 2025", endDate: "February 26, 2025", services: [Service(day: "Sunday, February 23", time: "10:00 AM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, February 26", time: "2:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "COM4", id_color: .programAlt2, title: "Violin Concerto in D Major", conductor: "Andris Nelsons", guest: ["Hilary Hahn, violin"], repertoire: [Repertoire(composer: "Beethoven", title: "Violin Concerto in D Major", instrumentation: "2222 - 2200 - timp - str")], venueName: "The Orpheum Theater", venueAddress: "409 S 16th St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "March 9, 2025", endDate: "March 12, 2025", services: [Service(day: "Sunday, March 9", time: "11:00 AM", location: "The Orpheum Theater", type: "Rehearsal"), Service(day: "Wednesday, March 12", time: "7:30 PM", location: "The Orpheum Theater", type: "Performance")]),
        Program(id: "LIVE4", id_color: .programAlt1, title: "A Night at the Opera", conductor: "Franz Welser-Möst", guest: ["Renée Fleming, soprano", "Joyce DiDonato, mezzo-soprano"], repertoire: [Repertoire(composer: "Bizet", title: "Selections from Carmen", instrumentation: "3333 - 4331 - timp, perc, hp - str"), Repertoire(composer: "Puccini", title: "Selections from La Bohème", instrumentation: "3333 - 4331 - timp, perc, hp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "March 23, 2025", endDate: "March 26, 2025", services: [Service(day: "Sunday, March 23", time: "1:00 PM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, March 26", time: "8:00 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW8", id_color: .alwaysAccentDark, title: "Beethoven & Brahms", conductor: "Christian Thielemann", guest: ["Lang Lang, piano"], repertoire: [Repertoire(composer: "Beethoven", title: "Piano Concerto No. 5 \"Emperor\"", instrumentation: "2222 - 2200 - timp - str"), Repertoire(composer: "Brahms", title: "Symphony No. 4", instrumentation: "2222 - 4230 - timp - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "April 6, 2025", endDate: "April 9, 2025", services: [Service(day: "Sunday, April 6", time: "10:00 AM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, April 9", time: "2:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "JOS4", id_color: .programAlt3, title: "Mozart's Requiem", conductor: "Mirga Gražinytė-Tyla", guest: [], repertoire: [Repertoire(composer: "Mozart", title: "Requiem", instrumentation: "222 - 4230 - timp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: Musician.mock, dress: .dressBlack, startDate: "April 20, 2025", endDate: "April 23, 2025", services: [Service(day: "Sunday, April 20", time: "11:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, April 23", time: "7:30 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW9", id_color: .alwaysAccentDark, title: "Romantic Masterpieces", conductor: "Yannick Nézet-Séguin", guest: ["Hilary Hahn, violin"], repertoire: [Repertoire(composer: "Mendelssohn", title: "Violin Concerto in E minor", instrumentation: "2222 - 2200 - timp - str"), Repertoire(composer: "Schumann", title: "Symphony No. 4", instrumentation: "2222 - 4230 - timp - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: nil, dress: .dressBlack, startDate: "May 4, 2025", endDate: "May 7, 2025", services: [Service(day: "Sunday, May 4", time: "1:00 PM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, May 7", time: "8:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "COM5", id_color: .programAlt2, title: "The Planets", conductor: "Andris Nelsons", guest: ["Joshua Bell, violin", "Yo-Yo Ma, cello"], repertoire: [Repertoire(composer: "Holst", title: "The Planets", instrumentation: "3333 - 4331 - timp, perc, hp - str")], venueName: "The Orpheum Theater", venueAddress: "409 S 16th St, Omaha, NE 68102", personnel: nil, dress: .dressBlack, startDate: "May 18, 2025", endDate: "May 21, 2025", services: [Service(day: "Sunday, May 18", time: "10:00 AM", location: "The Orpheum Theater", type: "Rehearsal"), Service(day: "Wednesday, May 21", time: "2:00 PM", location: "The Orpheum Theater", type: "Performance")]),
        Program(id: "LIVE5", id_color: .programAlt1, title: "Symphonic Dances", conductor: "Franz Welser-Möst", guest: ["Yuja Wang, piano"], repertoire: [Repertoire(composer: "Rachmaninoff", title: "Symphonic Dances", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: nil, dress: .dressBlack, startDate: "June 1, 2025", endDate: "June 4, 2025", services: [Service(day: "Sunday, June 1", time: "11:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, June 4", time: "7:30 PM", location: "The Joslyn Art Museum", type: "Performance")]),
        Program(id: "MW10", id_color: .alwaysAccentDark, title: "American Voices", conductor: "Christian Thielemann", guest: ["Joyce DiDonato, mezzo-soprano"], repertoire: [Repertoire(composer: "Copland", title: "Appalachian Spring", instrumentation: "2222 - 2200 - str"), Repertoire(composer: "Bernstein", title: "Symphonic Dances from West Side Story", instrumentation: "3333 - 4331 - timp, perc - str")], venueName: "Holland Performing Arts Center", venueAddress: "1200 Douglas St, Omaha, NE 68102", personnel: nil, dress: .dressBlack, startDate: "June 15, 2025", endDate: "June 18, 2025", services: [Service(day: "Sunday, June 15", time: "1:00 PM", location: "Holland Performing Arts Center", type: "Rehearsal"), Service(day: "Wednesday, June 18", time: "8:00 PM", location: "Holland Performing Arts Center", type: "Performance")]),
        Program(id: "JOS5", id_color: .programAlt3, title: "Opera Highlights", conductor: "Mirga Gražinytė-Tyla", guest: ["Renée Fleming, soprano"], repertoire: [Repertoire(composer: "Verdi", title: "Selections from La Traviata", instrumentation: "3333 - 4331 - timp, perc, hp - str"), Repertoire(composer: "Puccini", title: "Selections from Tosca", instrumentation: "3333 - 4331 - timp, perc, hp - str")], venueName: "The Joslyn Art Museum", venueAddress: "2200 Dodge St, Omaha, NE 68102", personnel: nil, dress: .dressBlack, startDate: "June 29, 2025", endDate: "July 2, 2025", services: [Service(day: "Sunday, June 29", time: "10:00 AM", location: "The Joslyn Art Museum", type: "Rehearsal"), Service(day: "Wednesday, July 2", time: "2:00 PM", location: "The Joslyn Art Museum", type: "Performance")]),
    ]

}


struct Service: Identifiable, Equatable, Hashable {
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
