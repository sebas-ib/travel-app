//
//  CreateView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct CreateView: View {
    
    var body: some View {
        ZStack {
            Color(.blue).ignoresSafeArea()
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "New Trip")
        }
    }
}

#Preview {
    CreateView()
}
