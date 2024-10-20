//
//  SettingsView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//
import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack {
                List{
                    Text("Account")
                    Text("Friend Requests")
                    Text("Upload Settings")
                    Text("Appearance")
                }.scrollContentBackground(.hidden)
                    .safeAreaPadding(.top, 50)
            }
            
            NavBar(topNavBar: true, search: false, settings: false, back: true, title: "Settings")
            
        }.navigationBarBackButtonHidden(true)
    }
}
