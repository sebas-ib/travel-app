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
                .padding([.top, .leading, .trailing])
            
            Group {
                if vm.itinerary.countries.count == 0 {
                    Text("Start by adding a country")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                } else if vm.itinerary.cities.count == 0 {
                    Text("Add another country if you'd like, or set your trip dates")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
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
                .padding(.leading)
            }
            
            DateRangePicker(startDate: $vm.itinerary.arrivalDate, endDate: $vm.itinerary.departureDate)
                .padding(.horizontal)
                .ignoresSafeArea(.keyboard)
                .transition(.opacity)
            
            Spacer()
        }.padding(.top,50)
        .sheet(isPresented: $isSheetShowing) {
            SelectCountrySheetView(
                textFieldObserver: textFieldObserver,
                vm: vm,
                isSheetShowing: $isSheetShowing,
                isSearching: _isSearching
            )
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                if vm.itinerary.countries.count != 0 {
                    Button(action: {
                        do {
                            vm.itinerary.name = vm.itinerary.countriesArray.map{$0.countryName}.joined(separator: ", ") + " Trip"
                            try vm.save()
                            dismiss()
                        } catch {
                            print("Failed to save itinerary: \(error)")
                        }
                    }) {
                        Text("Create")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 50.0)
                            .padding(.vertical, 15.0)
                            .background(Color("AppColor"))
                            .cornerRadius(30)
                        
                    }
                } else {
                    Text("Create")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 50.0)
                        .padding(.vertical, 15.0)
                        .background(.gray)
                        .cornerRadius(30)
                    
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
