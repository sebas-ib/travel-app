//
//  ContentView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    
    var provider = ItinerariesProvider.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView {
                    Group {
                        HomeView()
                            .tabItem {
                                Image("home")
                                    .renderingMode(.template)
                            }
                        
                        Spacer()
                        
                        PastTripsView()
                            .tabItem {
                                Image("bookmark")
                                    .renderingMode(.template)
                            }
                        
                        
                    }
                    .toolbarBackground(.ultraThinMaterial, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                }
                
                // Overlay a button in the middle of the TabView
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: CreateItineraryView(vm: .init(provider: provider))) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 70, height: 70)
                                    .shadow(radius: 4)
                                
                                Image("airplane")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .foregroundColor(Color.white)
                                    .shadow(radius: 4)
                            }
                            .offset(y: 10)
                        }
                        Spacer()
                    }
                }.ignoresSafeArea(.keyboard)
            }
        }
        .accentColor(Color("TextColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let preview = ItinerariesProvider.shared
        ContentView(provider: preview)
            .environment(\.managedObjectContext,preview.viewContext)
            .previewDisplayName("Itineraries with Data").onAppear{
                Itinerary.makePreview(count: 10, in: preview.viewContext)
            }
        
        let emptyPreview = ItinerariesProvider.shared
        ContentView(provider: preview)
            .environment(\.managedObjectContext,preview.viewContext)
            .previewDisplayName("Itineraries with No Data")
    }
}
