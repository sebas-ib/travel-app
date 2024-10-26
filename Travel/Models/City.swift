//
//  Country.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/23/24.
//
import Foundation
import CoreData

final class City: NSManagedObject, Identifiable {
    
    @NSManaged var cityName: String
    
    // Each city belongs to exactly one itinerary
    @NSManaged var itinerary: Itinerary?  // To-one relationship with Itinerary
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        cityName = "Unknown City"  // Optional default value
    }
}
