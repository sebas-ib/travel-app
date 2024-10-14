//
//  ContentView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TabView {
                Group{
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                    
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                    
                    CreateView()
                        .tabItem {
                            Image(systemName: "airplane.departure")

                        }
                    
                    SavedView()
                        .tabItem {
                            Image(systemName: "bookmark")
                        }
                    
                    AccountView()
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
            }
            .accentColor(Color("TextColor")) // Customize tab bar item color
        }
    }
}


#Preview {
    ContentView()
}
