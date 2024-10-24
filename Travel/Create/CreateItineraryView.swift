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
        VStack(alignment: .center) {
            
            Text("Plan Your Trip")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(Color("AppColor"))
            
            if vm.itinerary.countries.count == 0 {
                Text("Start by adding a country")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            } else if vm.itinerary.cities.count == 0 {
                Text("Add cities if you'd like, or add another country")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            
            
            Button {
                isSheetShowing = true
            } label: {
                SelectCountry()
            }
            
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(vm.itinerary.countriesArray, id: \.self) { country in
                        RemoveLocation(vm: vm, country: country)
                    }
                }
            }
            
            //            if !(vm.itinerary.countries.count == 0) {
            //                let temp = vm.itinerary.countriesArray
            //                SelectedCity(place: $vm.itinerary.cities[0])
            //            }
            
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
                if vm.itinerary.countries.count != 0 {
                    Button(action: {
                        do {
                            try vm.save()
                            dismiss()
                        } catch {
                            print("Failed to save itinerary: \(error)")
                        }
                    }) {
                        Text("Create").foregroundStyle(.white)
                            .padding(5.0)
                            .background(Color("AppColor"))
                            .cornerRadius(10)
                        
                    }
                } else {
                    Text("Create")
                        .foregroundStyle(.white)
                        .padding(5.0)
                        .background(.gray)
                        .cornerRadius(10)
                    
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
