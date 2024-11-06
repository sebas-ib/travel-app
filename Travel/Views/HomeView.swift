//
//  HomeView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI
import FirebaseAnalytics

struct HomeView: View {
    @FetchRequest(fetchRequest: Itinerary.all()) private var itineraries
    
    var currentItineraries: [Itinerary] {
        itineraries.filter {
            (Calendar.current.isDate($0.arrivalDate, inSameDayAs: Date.now) ||
            Calendar.current.compare($0.arrivalDate, to: Date.now, toGranularity: .day) == .orderedAscending) && Calendar.current.compare($0.departureDate, to: Date.now, toGranularity: .day) != .orderedAscending
        }
    }
    
    var pastItineraries: [Itinerary] {
        itineraries.filter {
            !((Calendar.current.isDate($0.arrivalDate, inSameDayAs: Date.now) ||
            Calendar.current.compare($0.arrivalDate, to: Date.now, toGranularity: .day) == .orderedAscending) && Calendar.current.compare($0.departureDate, to: Date.now, toGranularity: .day) != .orderedAscending)
        }
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            
            VStack {
                List {
                    if !currentItineraries.isEmpty {
                        Section(header: Text("Current").font(.caption).bold()) {
                            ForEach(currentItineraries) { itinerary in
                                placeNavigationLink(itinerary: itinerary)
                            }
                        }
                    }
                    
                    if !pastItineraries.isEmpty {
                        Section(header: Text("Upcoming").font(.caption).bold()) {
                            ForEach(pastItineraries) { itinerary in
                                placeNavigationLink(itinerary: itinerary)
                            }
                        }
                    }
                }
                .listStyle(.grouped)
            }
            .safeAreaPadding(.top, 70)
            //            ScrollView(.vertical) {
            //                VStack(alignment: .leading, spacing: 15.0) {
            //                    ForEach(itineraries) { itinerary in
            //                        if !(Calendar.current.compare(itinerary.departureDate, to: Date.now, toGranularity: .day) == .orderedAscending) {
            //                            placeNavigationLink(itinerary: itinerary)
            //                        }
            //                    }
            //                }.padding(.horizontal, 10.0)
            //            }
            //            .safeAreaPadding(.top, 75)
            //            .safeAreaPadding(.bottom, 30)
            //            .scrollIndicators(.hidden)
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Your Trips")
        }
    }
    
    func placeNavigationLink(itinerary: Itinerary) -> some View {
        NavigationLink(destination: TripView(itinerary: itinerary)) {
            SavedItineraryView(itinerary: itinerary)
                .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}



