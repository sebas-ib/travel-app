//
//  HomeView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI


struct HomeView: View {
    @State private var text = ""
    
    @FetchRequest(fetchRequest: Itinerary.all()) private var itineraries
    
    var body: some View {
        ZStack {
            
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack{
                ScrollView(.vertical) {
                    HStack{
                        Spacer()
                        VStack(alignment: .leading, spacing: 15.0){
                            
                            Text("Trending Itineraries").fontWeight(.semibold)
                            ScrollView(.horizontal){
                                HStack{
                                    
//                                    placeNavigationLink(plan:itineraries[0])
                                    
                                    ForEach(itineraries) { itinerary in
                                        placeNavigationLink(itinerary: itinerary)
                                    }
                                                                        
                                }
                            }.scrollIndicators(.hidden)
                            
                            
                            Text("Itineraries By Country").fontWeight(.semibold)
                            
                            LargePlaceView(image: Image("paris"),place: "France",tripsCount: 432)
                            LargePlaceView(image: Image("unitedstates"),place: "The United States",tripsCount: 231)
                            LargePlaceView(image:Image("germany"),place:"Germany",tripsCount: 634)
                            LargePlaceView(image: Image("belgium"),place: "Belgium",tripsCount: 857)
                        }
                        Spacer()
                    }
                }
            }
            .safeAreaPadding(.top,75)
            .safeAreaPadding(.bottom,30)
            .scrollIndicators(.hidden)
            
            
            
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Discover")
            
        }
        
    }
    
    func placeNavigationLink(itinerary: Itinerary) -> some View {
        NavigationLink(destination: TripView(itinerary: itinerary)) {
            SmallPlaceView(itinerary: itinerary)
        }
    }
}
