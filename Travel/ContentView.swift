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
            NavBar(topNavBar: true, bottomNavBar: true, search: false, settings: true, back: false, title: "Discover")
        }
    }
}


#Preview {
    ContentView()
}
