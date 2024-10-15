//
//  Event+CoreDataProperties.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var eventDesc: String?
    @NSManaged public var eventLocation: String?
    @NSManaged public var eventName: String?
    @NSManaged public var eventTime: Date?
    @NSManaged public var itinerary: Itinerary?

}

extension Event : Identifiable {

}
