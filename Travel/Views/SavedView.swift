//
//  SavedView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct SavedView: View {
    var body: some View {
        ZStack{
            Color(.orange).ignoresSafeArea()
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Saved")
        }
    }
}

#Preview {
    SavedView()
}
