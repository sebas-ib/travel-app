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
        List {
            // Text fields
            TextField("Country", text: $vm.itinerary.country)
                .keyboardType(.namePhonePad)
            TextField("City", text: $vm.itinerary.city)
                .keyboardType(.namePhonePad)
            
            // Date range picker for arrival and departure dates
            DateRangePicker(startDate: $vm.itinerary.arrivalDate, endDate: $vm.itinerary.departureDate)
            
        }
        .toolbar {
            // Done button to save itinerary
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        // Try to save and dismiss view when done
                        vm.itinerary.name = "\(vm.itinerary.country) Travel Itinerary"
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

struct DateRangePicker: View {
    @Binding var startDate: Date
    @Binding var endDate: Date

    var body: some View {
        VStack {
            HStack {
                DatePicker("Arrival", selection: $startDate, in: Date()..., displayedComponents: .date)
                
                Spacer()
                
                DatePicker("Departure", selection: $endDate, in: startDate..., displayedComponents: .date)
            }
            .padding(.horizontal)
            
            // Display a visual range of selected dates
            Text("\(formattedDateRange(startDate: startDate, endDate: endDate))")
        }
    }

    // Helper function to format the date range for display
    private func formattedDateRange(startDate: Date, endDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
    }
}

// Preview
struct CreateItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let preview = ItinerariesProvider.shared
            
            // Pass a preview context for the view model
            CreateItineraryView(vm: .init(provider: preview)).environment(\.managedObjectContext, preview.viewContext)
        }
    }
}
