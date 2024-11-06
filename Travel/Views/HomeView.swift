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
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 15.0) {
                    if itineraries.isEmpty {
                        Text("Your itineraries will show up here")
                            .font(.callout)
                            .foregroundStyle(Color.black.opacity(0.25))
                    }
                    
                    ForEach(itineraries) { itinerary in
                        placeNavigationLink(itinerary: itinerary)
                    }
                }.padding(.horizontal, 10.0)
            }
            .safeAreaPadding(.top, 75)
            .safeAreaPadding(.bottom, 30)
            .scrollIndicators(.hidden)
            
            // Navigation Bar
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Your Itineraries")
        }
    }
    
    func placeNavigationLink(itinerary: Itinerary) -> some View {
        NavigationLink(destination: TripView(itinerary: itinerary)) {
            SavedItineraryView(itinerary: itinerary)
        }
    }
}



