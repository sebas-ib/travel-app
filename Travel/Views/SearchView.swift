//
//  AccountView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct SearchView: View {
    
    var body: some View {
        ZStack {
            Color(.purple).ignoresSafeArea()
            
            NavBar(topNavBar: true, search: true, settings: true, back: false, title: "")
        }
    }
}

#Preview {
    SearchView()
}
