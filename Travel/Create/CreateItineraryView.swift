//
//  CreateItineraryView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import SwiftUI

struct CreateItineraryView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: EditItineraryViewModel
    
    var body: some View {
        List{
            TextField("Country",text: $vm.itinerary.country).keyboardType(.namePhonePad)
            TextField("City",text: $vm.itinerary.city).keyboardType(.namePhonePad)
            
            
        }.navigationTitle("Create Itinerary")
            .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done"){
                    do{
                        try vm.save()
                        dismiss()
                    }catch{
                        print(error)
                    }
                }
            }
        }
    }
}

struct CreateItineraryView_Previews:PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CreateItineraryView(vm: .init(provider:.shared))
        }
    }
}
