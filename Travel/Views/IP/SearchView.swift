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
            
            Color("BackgroundColor").ignoresSafeArea()

            VStack{
                ScrollView(.vertical) {
                    HStack{
                        Spacer()
                        VStack{

                        }
                        Spacer()
                    }
                }
            }.safeAreaPadding(.vertical,75)
            
            
            
            
            NavBar(topNavBar: true, search: true, settings: true, back: false, title: "")
        }
    }
}
