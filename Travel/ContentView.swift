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
            ZStack{
                TabView {
                    Group{
                        
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
                        
                        CreateView()
                            .tabItem {
                                Image("airplane")
                                    .renderingMode(.template)
                                
                            }
                        
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
                }
                .accentColor(Color("TextColor"))
                // Customize tab bar item color
            }
        }
    }
    
}


#Preview {
    ContentView()
}
