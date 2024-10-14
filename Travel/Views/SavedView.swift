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
            
            Color("BackgroundColor").ignoresSafeArea()

            VStack{
                ScrollView(.vertical) {
                    HStack{
                        Spacer()
                        VStack{
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            Text("Test").font(.largeTitle).foregroundStyle(Color("TextColor"))
                            
                        }
                        Spacer()
                    }
                }
            }.safeAreaPadding(.vertical,75)
            
            
            
            
            NavBar(topNavBar: true, search: false, settings: true, back: false, title: "Saved")
        }
    }
}
