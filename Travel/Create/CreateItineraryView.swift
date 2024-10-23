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
    @FocusState var isSearching

    @State private var isSheetShowing: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            // Search TextField
            Button {
                isSheetShowing = true
            } label: {
                SelectedCountry(place: $vm.itinerary.country)
            }
            
            if vm.itinerary.country != "" {
                HStack{
                    Image(systemName: "arrow.turn.down.right")
                        .padding(.leading, 40.0)
                        .font(.title)
                    
                    SelectedCity(place: $vm.itinerary.city)
                }
            }
            // Date Range Picker
            DateRangePicker(startDate: $vm.itinerary.arrivalDate, endDate: $vm.itinerary.departureDate)
                .padding(.horizontal)
                .ignoresSafeArea(.keyboard)
                .transition(.opacity)

            Spacer()
        }
        .sheet(isPresented: $isSheetShowing) {
            SelectCountrySheetView(
                textFieldObserver: textFieldObserver,
                vm: vm,
                isSheetShowing: $isSheetShowing,
                isSearching: _isSearching
            )
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                if vm.itinerary.country != "" {
                    Button(action: {
                        do {
                            try vm.save()
                            dismiss()
                        } catch {
                            print("Failed to save itinerary: \(error)")
                        }
                    }) {
                        Text("Create").foregroundStyle(.blue)
                    }
                } else {
                    Text("Create").foregroundStyle(.gray)
                }
            }
        }
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
