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
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.white)
                        .frame(height: 40)
                        .shadow(radius: 2.5)
                )
                .padding(.top, 50)
                .padding(.horizontal)
                .focused($isSearching)
                .disableAutocorrection(true)
            
            if !textFieldObserver.searchResults.isEmpty && textFieldObserver.debouncedText == textFieldObserver.searchText {
                List(textFieldObserver.searchResults, id: \.self) { result in
                    Button {
                        let selectedCountry = Country(context: vm.viewContext)
                        selectedCountry.countryName = result
                        vm.itinerary.addCountry(selectedCountry)
                        
                        // Update the itinerary's name
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
            } else if textFieldObserver.isSearching {
                VStack {
                    ProgressView("")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
            } else if textFieldObserver.searchResults.isEmpty && textFieldObserver.debouncedText == textFieldObserver.searchText && textFieldObserver.searchText != "" {
                Text("No Results")
            }
            
            Spacer()
        }.onAppear {
            isSearching = true
        }
    }
}

