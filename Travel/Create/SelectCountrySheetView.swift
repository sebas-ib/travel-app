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
                        vm.itinerary.country = result
                        vm.itinerary.name = "\(vm.itinerary.country) Travel Itinerary"
                        isSearching = false
                        textFieldObserver.searchText = ""
                        isSheetShowing = false
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

