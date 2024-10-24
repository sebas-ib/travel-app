//
//  RemoveLocation.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/23/24.
//
import SwiftUI

struct RemoveLocation: View {
    @ObservedObject var vm: EditItineraryViewModel
    var country: Country
    
    var body: some View {
        HStack(alignment: .center) {
            
            Text(country.countryName)
                .foregroundColor(.white)
                .padding([.top, .leading, .bottom])

            Button {
                print("Removing country: \(country.countryName)")
                print("Countries before removal: \(vm.itinerary.countriesArray.map { $0.countryName })")
                vm.itinerary.removeCountry(country)
                print("Countries after removal: \(vm.itinerary.countriesArray.map { $0.countryName })")
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding(.trailing)
            }

        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color("AppColor"))
                .shadow(radius: 2.5)
        )
        .padding(.leading, 5.0)
        .font(.footnote)
    }
    
}

struct RemoveLocation_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            let preview = ItinerariesProvider.shared
            
            // Pass a preview context for the view model
//            RemoveLocation(vm: .init(provider: preview))
//                .environment(\.managedObjectContext, preview.viewContext)
        }
    }
}

