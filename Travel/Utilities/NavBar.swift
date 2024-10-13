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
    
    let title: String
    let destination: AnyView // Use AnyView to allow flexibility
    
    @State private var searchText = ""
    @FocusState private var isSearching: Bool
    
    @Environment(\.presentationMode) var presentationMode // Access to presentation mode


    var body: some View {
        VStack {
            // Top Navigation Bar
            
            if topNavBar{
                HStack {
                    if title != "" {
                        Text(title)
                            .font(.title)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    
                    if search {
                        HStack(alignment: .center){
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.white)
                                .padding(.leading, 10)
                                .font(.title3)
                            
                            TextField("", text: $searchText)
                                .font(.headline)
                                .fontWeight(.light)
                                .frame(height: 40.0)
                                .focused($isSearching)
                            Spacer()
                            
                        }
                        .background(Color.white.opacity(0.25))
                        .cornerRadius(20)
                        .padding(.horizontal, 3)
                    }
                }
                .padding()
                .background(Color.black)
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
                            NavigationLink(destination: destination) {
                                Image(systemName: "plus.circle")
                                    .font(.largeTitle)
                            }
                            Spacer()

                            Image(systemName: "bookmark")
                            Spacer()
                            
                            Image(systemName: "person")
                            Spacer()
                        }.foregroundStyle(Color.white).font(.title3)
                }
                .padding(.top)
                .background(Color.black)
            }
        }
    }
}



#Preview {
    NavigationStack {
        NavBar(topNavBar:true,bottomNavBar:true,search:true,title: "Discover", destination: AnyView(EmptyView()))
    }
}
