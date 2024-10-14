//
//  HomeView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI


struct HomeView: View {
    @State private var text = ""
    
    var body: some View {
        ZStack {
            
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack{
                ScrollView(.vertical) {
                    HStack{
                        Spacer()
                        VStack(spacing: 15.0){
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
            
            
            
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Discover")
            
        }
        
    }
}
