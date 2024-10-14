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
            Color(.yellow).ignoresSafeArea()
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Discover")
            
        }

    }
}

// Preview struct
#Preview {
    HomeView()
}
