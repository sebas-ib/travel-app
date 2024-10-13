//
//  HomeView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI


struct HomeView: View {
    @Binding var path: [AppView]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                
                VStack {
                    Text("Hit")
                }
                
                

                
                // Your custom navigation bar
                NavBar(topNavBar: true, bottomNavBar: true, search: false, settings: true, back:false,title: "Discover")
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button
        }
        
    }
}

// Preview struct
struct HomeView_Previews: PreviewProvider {
    @State static var path: [AppView] = [] // Static variable for preview
    
    static var previews: some View {
        HomeView(path: $path) // Pass the binding to the preview
    }
}
