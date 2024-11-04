//
//  Day.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/03/24.
//
import Foundation
import CoreData

final class DayPlan: NSManagedObject, Identifiable {
    
    @NSManaged var date: Date
    @NSManaged var dayPlan: String
    
    
    // Each city belongs to exactly one itinerary
    @NSManaged var itinerary: Itinerary?  // To-one relationship with Itinerary
    
    @NSManaged var events: NSSet
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        dayPlan = ""  // Optional default value
        date = Date.now
    }
    
    
    func addEvent(_ event: EventDetails) {
        self.mutableSetValue(forKey: "events").add(event)
        event.dayPlan = self
    }
    
    func removeEvent(_ event: EventDetails) {
        self.mutableSetValue(forKey: "events").remove(event)
        event.dayPlan = nil
    }
}
