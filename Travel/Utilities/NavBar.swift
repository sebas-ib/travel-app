//
//  NavBar.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct NavBar: View {

    let topNavBar: Bool
    let bottomNavBar: Bool
    let search: Bool
    let settings: Bool
    
    let back: Bool
    
    let title: String
    
    @State private var searchText = ""
    @FocusState private var isSearching: Bool
    
    @Environment(\.presentationMode) var presentationMode // Access to presentation mode


    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                VStack {
                    // Top Navigation Bar
                    
                    if topNavBar{
                        HStack {
                            
                            if back {
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "chevron.left") // Back arrow icon
                                            .font(.title).foregroundStyle(Color("TextColor"))
                                    }
                                }
                            }
                            
                            
                            if title != "" {
                                Text(title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("TextColor"))
                                Spacer()
                                
                                
                            }
                            
                            if search {
                                HStack(alignment: .center){
                                    Image(systemName: "magnifyingglass")
                                        .foregroundStyle(Color("TextColor"))
                                        .padding(.leading, 10)
                                        .font(.title3)
                                    
                                    TextField("", text: $searchText)
                                        .font(.headline)
                                        .fontWeight(.light)
                                        .frame(height: 40.0)
                                        .focused($isSearching)
                                    Spacer()
                                }
                                .background(Color("TextColor").opacity(0.10))
                                .cornerRadius(20)
                                .padding(.horizontal, 3)
                            }
                            
                            if settings {
                                NavigationLink(destination: SettingsView()) {
                                    Image(systemName: "gearshape")
                                        .foregroundStyle(Color("TextColor"))
                                        .font(.title3)
                                }
                            }
                            
                            
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                    }
                    
                    Spacer() // Spacer to push content away
                    
                    // Bottom Navigation Bar
                    if bottomNavBar {
                        HStack {
                            HStack{
                                Spacer()
                                Image(systemName: "house")
                                Spacer()
                                
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                
                                Image(systemName: "airplane.departure")
                                    .font(.largeTitle)
                                Spacer()
                                
                                Image(systemName: "bookmark")
                                Spacer()
                                
                                Image(systemName: "person")
                                Spacer()
                            }.foregroundStyle(Color("TextColor")).font(.title3)
                        }
                        .padding(.top)
                        .background(.ultraThinMaterial)
                    }
                }
            }
        }
    }
}


#Preview {
    NavBar(topNavBar: true, bottomNavBar: true, search: true, settings: true, back: true, title: "Discover")
}
