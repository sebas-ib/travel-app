//
//  SelectCountrySheetView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/22/24.
//
import SwiftUI

struct SelectCountrySheetView: View {
    @ObservedObject var textFieldObserver: TextFieldObserver
    @ObservedObject var vm: EditItineraryViewModel
    @Binding var isSheetShowing: Bool
    @FocusState var isSearching: Bool

    

    var body: some View {
        VStack {
            TextField("Search for a country...", text: $textFieldObserver.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 50)
                .padding(.horizontal)
                .focused($isSearching)
                .disableAutocorrection(true)

            if !textFieldObserver.searchResults.isEmpty && textFieldObserver.debouncedText == textFieldObserver.searchText {
                List(textFieldObserver.searchResults, id: \.self) { result in
                    Button {
                        // Create a new Country instance and add it to the itinerary
                        let selectedCountry = Country(context: vm.viewContext) // Access the viewContext here
                        selectedCountry.countryName = result
                        vm.itinerary.addCountry(selectedCountry)
                        
                        // Update the itinerary's name
                        vm.itinerary.name = "\(vm.itinerary.countriesArray.map { $0.countryName }.joined(separator: ", ")) Travel Itinerary"
                        
                        // Clear the search text and hide the sheet
                        isSearching = false
                        textFieldObserver.searchText = ""
                        isSheetShowing = false
                        print("Current countries in itinerary: \(vm.itinerary.countriesArray.map { $0.countryName })")

                    } label: {
                        Text(result)
                    }
                }
                .listStyle(.plain)
                .background(.clear)
                .transition(.opacity)
            } else if textFieldObserver.searchText != "" && !textFieldObserver.searchResults.isEmpty {
                VStack {
                    ProgressView("")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
            } else if textFieldObserver.searchText != "" && textFieldObserver.searchResults.isEmpty && textFieldObserver.debouncedText != "" {
                Text("No Results")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }

            Spacer()
        }.onAppear {
            isSearching = true
        }
    }
}

