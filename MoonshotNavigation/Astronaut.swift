//
//  Astronaut.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
