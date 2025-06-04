//
//  PastTripsView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct PastTripsView: View {    
    @FetchRequest(fetchRequest: Itinerary.all()) private var itineraries
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 15.0) {
                    ForEach(itineraries) { itinerary in
                        if Calendar.current.compare(itinerary.departureDate, to: Date.now, toGranularity: .day) == .orderedAscending {
                            placeNavigationLink(itinerary: itinerary)
                        }
                    }
                }.padding(.horizontal, 10.0)
            }
            .safeAreaPadding(.top, 75)
            .safeAreaPadding(.bottom, 30)
            .scrollIndicators(.hidden)
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Past Trips")
        }
    }
    
    func placeNavigationLink(itinerary: Itinerary) -> some View {
        NavigationLink(destination: TripView(itinerary: itinerary)) {
            SavedItineraryView(itinerary: itinerary)
        }
    }
}
