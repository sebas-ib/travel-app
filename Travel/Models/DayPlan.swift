//
//  DayPlan.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import Foundation
import SwiftUICore

struct DayPlan: Identifiable {
    var id = UUID()  // This provides a unique identifier
    
    var dayNum: Int
    var weekDay: String
    var events : [Event]
}


let dayplans: [DayPlan] = [
    DayPlan(
        dayNum: 1, weekDay: "Monday", events: [eventsArr[0],eventsArr[0]]
    )
    
]



