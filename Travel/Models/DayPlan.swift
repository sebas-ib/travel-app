//
//  DayPlan.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import Foundation
import SwiftUICore

struct DayPlan: Identifiable, Hashable, Equatable {
    var id = UUID()  // This provides a unique identifier
    
    var dayNum: Int
    var weekDay: String
    var events : [Event]
}


let dayplans: [DayPlan] = [
    DayPlan(
        dayNum: 1, weekDay: "Monday", events: eventsArr
    ),
    DayPlan(
        dayNum: 2, weekDay: "Tuesday", events: eventsArr2
    ),
    DayPlan(
        dayNum: 3, weekDay: "Wednesday", events: eventsArr3
    ),
    DayPlan(
        dayNum: 4, weekDay: "Thursday", events: eventsArr4
    )
]



