//
//  EditItineraryViewModel.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import Foundation
import CoreData

final class EditItineraryViewModel: ObservableObject {
    
    @Published var itinerary: Itinerary
    
    private let context: NSManagedObjectContext
    
    init(provider: ItinerariesProvider, contact: Itinerary? = nil){
        self.context = provider.newContext
        self.itinerary = Itinerary(context: self.context)
    }
    
    func save() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
