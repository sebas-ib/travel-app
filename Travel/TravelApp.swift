//
//  TravelApp.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

@main
struct TravelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, ItinerariesProvider.shared.viewContext)
        }
    }
}
