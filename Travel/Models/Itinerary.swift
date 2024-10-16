//
//  Itinerary.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import Foundation
import CoreData

final class Itinerary: NSManagedObject, Identifiable {
    
    @NSManaged var city: String
    @NSManaged var country: String

    
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
    }
}

extension Itinerary {
    private static var itinerariesFetchRequest: NSFetchRequest<Itinerary> {
        NSFetchRequest(entityName: "Itinerary")
    }
    
    static func all() -> NSFetchRequest<Itinerary> {
        let request: NSFetchRequest<Itinerary> = itinerariesFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Itinerary.country, ascending: true)
        ]
        return request
    }
}



