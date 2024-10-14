//
//  AccountView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            
            Color("BackgroundColor").ignoresSafeArea()
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Account")
            
        }
    }
}

#Preview {
    AccountView()
}
