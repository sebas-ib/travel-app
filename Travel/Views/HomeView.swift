//
//  HomeView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI
import FirebaseAnalytics

struct HomeView: View {
    @State private var text = ""
    
    @FetchRequest(fetchRequest: Itinerary.all()) private var itineraries
    
    var body: some View {
        ZStack {
            // Background Color
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            // Main Content
            VStack {
                ScrollView(.vertical) {
                    HStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 15.0) {
                            ForEach(itineraries) { itinerary in
                                placeNavigationLink(itinerary: itinerary)
                            }
                        }
                        Spacer()
                    }
                }
                .safeAreaPadding(.top, 75)
                .safeAreaPadding(.bottom, 30)
                .scrollIndicators(.hidden)
            }

            // Navigation Bar
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Your Itineraries")
        }
}
    
    func placeNavigationLink(itinerary: Itinerary) -> some View {
        NavigationLink(destination: TripView(itinerary: itinerary)) {
            SmallPlaceView(itinerary: itinerary)
        }
    }
}
