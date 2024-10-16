//
//  ItinerariesProvider.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import Foundation
import CoreData
import SwiftUICore

final class ItinerariesProvider {
    
    static let shared = ItinerariesProvider()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var newContext: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
    
    private init (){
        
        
        
        persistentContainer = NSPersistentContainer(name: "DataModel")
        
        if EnvironmentValues.isPreview {
            persistentContainer.persistentStoreDescriptions.first?.url = .init(fileURLWithPath: "/dev/null")
        }
        
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores{ _, error in
            if let error {
                
                fatalError("Unable to load store with error: \(error)")
            }
            
        }
        
    }
    
}


extension EnvironmentValues {
    static var isPreview: Bool{
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        
    }
    
}
