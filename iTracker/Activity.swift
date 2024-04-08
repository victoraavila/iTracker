//
//  Activity.swift
//  iTracker
//
//  Created by Víctor Ávila on 05/04/24.
//

import Foundation

struct Activity: Hashable, Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    let category: String
    let priority: String
    var numberOfTimes: Int
}

