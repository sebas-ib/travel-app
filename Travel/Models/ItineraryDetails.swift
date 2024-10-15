//
//  ItineraryDetails.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import Foundation
import SwiftUICore

struct ItineraryDetails: Identifiable {
    var id = UUID()  // This provides a unique identifier
    var countries : [String]
    var cities : [String]
    var startDate: Date
    var endDate: Date
    var activities: [DayPlan]
    
    var image : Image
}


let itineraries: [ItineraryDetails] = [
    ItineraryDetails(
        countries: ["Austria"],
        cities: ["Salzburg"],
        startDate: Date(),
        endDate: Calendar.current.date(byAdding: .day, value: 4, to: Date())!,
        activities:
            dayplans
        ,
        image: Image("salzburg")
    ),ItineraryDetails(
        countries: ["USA"],
        cities: ["New York"],
        startDate: Calendar.current.date(byAdding: .day, value: 5, to: Date())!,
        endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!,
        activities: newYorkDayPlans,
        image: Image("newyork") // Assuming you have an image asset named "new_york"
    )
]



