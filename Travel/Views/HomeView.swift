//
//  HomeView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI


struct HomeView: View {
    var body:some View {
        NavigationStack{
            ZStack{
                
                Color("BackgroundColor").ignoresSafeArea()
                                
                NavBar(topNavBar: true, bottomNavBar: true, search: false, settings: true, back:false,title: "Discover", destination: AnyView(EmptyView()))
            }
        }
        
    }
}

#Preview {
    HomeView()
}
