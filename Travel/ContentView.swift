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
                        
                        SearchView()
                            .tabItem {
                                Image("magnifingglass")
                                    .renderingMode(.template)
                            }

                        Spacer()

                        SavedView()
                            .tabItem {
                                Image("bookmark")
                                    .renderingMode(.template)
                            }

                        AccountView()
                            .tabItem {
                                Image("person")
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

#Preview {
    ContentView()
}
