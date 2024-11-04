//
//  Event.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/4/24.
//

import Foundation
import CoreData

final class EventDetails: NSManagedObject, Identifiable {
    
    @NSManaged var name: String
    @NSManaged var desc: String
    @NSManaged var time: Date
    
    
    @NSManaged var dayPlan: DayPlan?
    
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        time = Date.now
    }
}
