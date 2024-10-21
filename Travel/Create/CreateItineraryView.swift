//
//  CreateItineraryV.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/19/24.
//
import SwiftUI

struct CreateItineraryView: View {
    @ObservedObject var textFieldObserver = TextFieldObserver(delay: .milliseconds(500)) // Set debounce delay
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var vm: EditItineraryViewModel

//    // Computed property to filter places based on searchText
//    var filteredPlaces: [(Cities, String, String)] { // Tuple of (City, State Name, Country Name)
//            guard !textFieldObserver.debouncedText.isEmpty else { return [] }
//            
//            let lowercasedSearchText = textFieldObserver.debouncedText.lowercased().replacingOccurrences(of: " ", with: "")
//            let maxResults = 10
//            var results: [(Cities, String, String)] = []
//            
//            // Manual iteration through countries, states, and cities
//            for country in countries {
//                for state in country.states {
//                    for city in state.cities {
//                        // Combine city, state, and country names into a single searchable string
//                        let fullPlaceName = "\(city.name) \(state.name) \(country.name)"
//                            .lowercased()
//                            .replacingOccurrences(of: " ", with: "")
//                        
//                        // Check if the search text matches
//                        if fullPlaceName.contains(lowercasedSearchText) {
//                            results.append((city, state.name, country.name))
//                            
//                            // Stop once we reach maxResults
//                            if results.count >= maxResults {
//                                return results
//                            }
//                        }
//                    }
//                }
//            }
//            
//            return results
//        }


    var body: some View {
        VStack {
            // Search TextField
            TextField("Search for a city...", text: $textFieldObserver.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Filtered Places List


            // Date Range Picker
            DateRangePicker(startDate: $vm.itinerary.arrivalDate, endDate: $vm.itinerary.departureDate)
                .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    do {
                        vm.itinerary.name = "\(vm.itinerary.country) Travel Itinerary"
                        try vm.save()
                        dismiss()
                    } catch {
                        print("Failed to save itinerary: \(error)")
                    }
                }) {
                    Text("Create")
                }
            }
        }.ignoresSafeArea(.keyboard)
    }
}

// Preview
struct CreateItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let preview = ItinerariesProvider.shared

            // Pass a preview context for the view model
            CreateItineraryView(vm: .init(provider: preview))
                .environment(\.managedObjectContext, preview.viewContext)
        }
    }
}
