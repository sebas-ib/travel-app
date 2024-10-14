//
//  SettingsView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//
import SwiftUI

struct SettingsView: View {
    
    
    // Access the presentation mode to handle view dismissal
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            
            
            NavBar(topNavBar: true, search: false, settings: false, back: true, title: "Settings")
            
            VStack {
                
                // Your view content goes here
                List{
                    Text("Account")
                    Text("Friend Requests")
                    Text("Upload Settings")
                    Text("Appearance")
                }.scrollContentBackground(.hidden)
                    .safeAreaPadding(.top, 50)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SettingsView()
}
