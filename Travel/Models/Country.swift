//
//  Country.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/23/24.
//
import Foundation
import CoreData

final class Country: NSManagedObject, Identifiable {
    
    @NSManaged var countryName: String
    @NSManaged var id: UUID // Unique identifier

    
    // Each country belongs to exactly one itinerary
    @NSManaged var itinerary: Itinerary?  // To-one relationship with Itinerary
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        countryName = "Unknown Country"  // Optional default value
    }
}

