//
//  Event.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import Foundation
import SwiftUICore

struct Event: Identifiable {
    var id = UUID()  // This provides a unique identifier
    
    var eventName : String
    var eventDesc : String
    var eventTime : Int
    var eventLocation : String
}


let eventsArr : [Event] = [
    Event(eventName: "Hohensalzburg Fortress", eventDesc: "Visit Hohensalzburg Fortress", eventTime: 0830, eventLocation: "Hohensalzburg Fortress")
]
