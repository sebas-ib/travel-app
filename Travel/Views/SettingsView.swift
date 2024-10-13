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
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack {
                    // Your view content goes here
                    List{
                        Text("Account")
                        Text("Friend Requests")
                        Text("Upload Settings")
                        Text("Appearance")

                        
                    }.safeAreaPadding(.vertical, 50)
                    
                    
                }
                
                

                
                // Your custom navigation bar
                NavBar(topNavBar: true, bottomNavBar: false, search: false, settings: false, back:true,title: "Settings", destination: AnyView(EmptyView()))
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button
        }
    }
}

#Preview {
    SettingsView()
}
