//
//  Event.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import Foundation
import SwiftUICore

struct Event: Identifiable,Hashable,Equatable {
    var id = UUID()  // This provides a unique identifier
    
    var eventName : String
    var eventDesc : String
    var eventTime : Date
    var eventLocation : String
}

func timeStringToDate(_ time: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "HHmm" // Expecting time as 24-hour format, e.g., "0830"
    return formatter.date(from: time)
}

let eventsArr: [Event] = [
    Event(eventName: "Landing at Airport",
          eventDesc: "Arrive at Salzburg Airport.",
          eventTime: timeStringToDate("0730")!, // Example time for landing
          eventLocation: "Salzburg Airport"),
    Event(eventName: "Hohensalzburg Fortress",
          eventDesc: "Visit Hohensalzburg Fortress",
          eventTime: timeStringToDate("0830")!,
          eventLocation: "Hohensalzburg Fortress"),
    Event(eventName: "Mirabell Palace Tour",
          eventDesc: "Explore the beautiful gardens and architecture of Mirabell Palace.",
          eventTime: timeStringToDate("1000")!,
          eventLocation: "Mirabell Palace, Salzburg"),
    Event(eventName: "Mozart Concert",
          eventDesc: "Enjoy a classical concert featuring Mozart's greatest works.",
          eventTime: timeStringToDate("1900")!,
          eventLocation: "Mozarteum, Salzburg"),
    Event(eventName: "Salzburg Cathedral Visit",
          eventDesc: "Discover the stunning architecture and history of the Salzburg Cathedral.",
          eventTime: timeStringToDate("1200")!,
          eventLocation: "Salzburg Cathedral, Salzburg")
]

let eventsArr2: [Event] = [
    Event(eventName: "Hellbrunn Palace",
          eventDesc: "Tour the beautiful Hellbrunn Palace and its trick fountains.",
          eventTime: timeStringToDate("0900")!,
          eventLocation: "Hellbrunn Palace, Salzburg"),
    Event(eventName: "St. Peter's Abbey",
          eventDesc: "Visit the historic St. Peter's Abbey, one of the oldest monasteries in the German-speaking world.",
          eventTime: timeStringToDate("1100")!,
          eventLocation: "St. Peter's Abbey, Salzburg"),
    Event(eventName: "Salzburg Festival",
          eventDesc: "Attend a performance at the renowned Salzburg Festival.",
          eventTime: timeStringToDate("1500")!,
          eventLocation: "Various venues, Salzburg"),
    Event(eventName: "Local Market Visit",
          eventDesc: "Experience the local culture at the Salzburg farmers' market.",
          eventTime: timeStringToDate("1700")!,
          eventLocation: "Schranne Market, Salzburg")
]

let eventsArr3: [Event] = [
    Event(eventName: "Eagle's Nest",
          eventDesc: "Take a day trip to the Eagle's Nest for breathtaking views.",
          eventTime: timeStringToDate("0800")!,
          eventLocation: "Eagle's Nest, Berchtesgaden"),
    Event(eventName: "Salzburg Zoo",
          eventDesc: "Visit the Salzburg Zoo and see various animals from around the world.",
          eventTime: timeStringToDate("1300")!,
          eventLocation: "Salzburg Zoo, Salzburg"),
    Event(eventName: "Sound of Music Tour",
          eventDesc: "Join the famous Sound of Music tour to see filming locations.",
          eventTime: timeStringToDate("1400")!,
          eventLocation: "Salzburg"),
    Event(eventName: "Dinner at a Traditional Austrian Restaurant",
          eventDesc: "Enjoy an authentic Austrian dinner at a local restaurant.",
          eventTime: timeStringToDate("1900")!,
          eventLocation: "Gasthof Goldene Ente, Salzburg"),
]

let eventsArr4: [Event] = [
    Event(eventName: "Salzburg Botanical Gardens",
          eventDesc: "Stroll through the beautiful botanical gardens in Salzburg.",
          eventTime: timeStringToDate("0900")!,
          eventLocation: "Botanical Gardens, Salzburg"),
    Event(eventName: "Salzburg Museum",
          eventDesc: "Explore the history and culture of Salzburg at the museum.",
          eventTime: timeStringToDate("1100")!,
          eventLocation: "Salzburg Museum, Salzburg"),
    Event(eventName: "River Cruise",
          eventDesc: "Enjoy a scenic river cruise on the Salzach River.",
          eventTime: timeStringToDate("1400")!,
          eventLocation: "Salzach River, Salzburg"),
    Event(eventName: "Evening Wine Tasting",
          eventDesc: "Experience a wine tasting event featuring local Austrian wines.",
          eventTime: timeStringToDate("1900")!,
          eventLocation: "Wine Bar, Salzburg"),
    Event(eventName: "Taking Off from Airport",
          eventDesc: "Depart from Salzburg Airport.",
          eventTime: timeStringToDate("2200")!,
          eventLocation: "Salzburg Airport")
]
