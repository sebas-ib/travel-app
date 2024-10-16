//
//  EditItineraryViewModel.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import Foundation
import CoreData

// View model for editing an itinerary
final class EditItineraryViewModel: ObservableObject {
    
    // Itinerary being edited
    @Published var itinerary: Itinerary
    
    // The CoreData context for saving
    private let context: NSManagedObjectContext
    
    // Initialize with a data provider and an optional existing itinerary
    init(provider: ItinerariesProvider, contact: Itinerary? = nil){
        self.context = provider.newContext
        self.itinerary = Itinerary(context: self.context) // Create a new itinerary in the context
    }
    
    // Save function if there are changes
    func save() throws {
        if context.hasChanges {
            try context.save()
            // Reset the itinerary after saving
            itinerary = Itinerary(context: context)
        }
    }
}
