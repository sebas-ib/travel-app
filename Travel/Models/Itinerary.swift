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
    @NSManaged var saved: Bool

    
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(false, forKey: "saved")
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



extension Itinerary {
    
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Itinerary]{
        var itineraries = [Itinerary]()
        for _ in 0..<count {
            let itinerary = Itinerary(context: context)
            itinerary.country = "France"
            itinerary.city = "Paris"
            itinerary.saved = false
            
            itineraries.append(itinerary)
        }
        return itineraries
    }
    
    static func preview(context:NSManagedObjectContext = ItinerariesProvider.shared.viewContext) -> Itinerary {
        return makePreview(count: 1, in: context)[0]
        
    }
    
    static func empty(context:NSManagedObjectContext = ItinerariesProvider.shared.viewContext) -> Itinerary {
        return Itinerary(context: context )
        
    }
}
