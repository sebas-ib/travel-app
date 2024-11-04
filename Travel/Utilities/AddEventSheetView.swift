//
//  AddEventSheetView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/4/24.
//
import SwiftUI

struct AddEventSheetView: View {

    @Binding var isSheetShowing: Bool
    
    
    
    var body: some View {
        VStack {
            Button {
                isSheetShowing = false
            }label:{
                Text("Done")
            }
            
        }.onAppear {
            
            
            
        }
    }
}


