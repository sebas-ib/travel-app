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
    var country : String
    var city : String
    var startDate: Date
    var endDate: Date
    var activities: [DayPlan]
    
    var image : Image
}


let itineraries: [ItineraryDetails] = [
    ItineraryDetails(
        country: "Austria",
        city: "Salzburg",
        startDate: Date(),
        endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!,
        activities: [
            dayplans[0],
        ],
        image: Image("salzburg")
    )
]



