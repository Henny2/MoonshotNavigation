//
//  Mission.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import Foundation

struct Mission: Codable, Identifiable {
    // nested struct, one struct inside another
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
