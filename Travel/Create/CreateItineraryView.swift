//
//  CreateItineraryView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import SwiftUI


// View for creating an itinerary
struct CreateItineraryView: View {
    
    // Dismiss the view
    @Environment(\.dismiss) var dismiss
    
    // View model to manage the itinerary data
    @ObservedObject var vm: EditItineraryViewModel
    
    var body: some View {
        List{
            
            // Text fields
            TextField("Country",text: $vm.itinerary.country).keyboardType(.namePhonePad)
            TextField("City",text: $vm.itinerary.city).keyboardType(.namePhonePad)
            
            
        }.navigationTitle("Create Itinerary")
            .toolbar {
                // Done button to save itinerary
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        // Try to save and dismiss view when done
                        try vm.save()
                        dismiss()
                    } catch {
                        
                        // Print error
                        print(error)
                    }
                }
            }
        }
    }
}

// Preview
struct CreateItineraryView_Previews:PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = ItinerariesProvider.shared
            
            // Pass a preview context for the view model
            CreateItineraryView(vm: .init(provider: preview)).environment(\.managedObjectContext,preview.viewContext)
        }
    }
}
