//
//  Itinerary+CoreDataProperties.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//
//

import Foundation
import CoreData


extension Itinerary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Itinerary> {
        return NSFetchRequest<Itinerary>(entityName: "Itinerary")
    }

    @NSManaged public var cities: [String]?
    @NSManaged public var countries: [String]?
    @NSManaged public var enddate: Date?
    @NSManaged public var image: Image?
    @NSManaged public var startdate: Date?
    @NSManaged public var event: NSSet?

}

// MARK: Generated accessors for event
extension Itinerary {

    @objc(addEventObject:)
    @NSManaged public func addToEvent(_ value: Event)

    @objc(removeEventObject:)
    @NSManaged public func removeFromEvent(_ value: Event)

    @objc(addEvent:)
    @NSManaged public func addToEvent(_ values: NSSet)

    @objc(removeEvent:)
    @NSManaged public func removeFromEvent(_ values: NSSet)

}

extension Itinerary : Identifiable {

}
