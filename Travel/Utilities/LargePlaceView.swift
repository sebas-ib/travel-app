//
//  LargePlaceView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import SwiftUI

struct LargePlaceView : View {
    let image : Image
    let place : String
    
    let tripsCount: Int
    
    var body : some View {
        ZStack {
            image.resizable().cornerRadius(20).frame(height: 200.0)
            VStack {
                HStack(alignment: .top){
                    Text("Trips to \(place)")
                        .shadow(color: Color("BackgroundColor"), radius: 4)
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding([.top, .leading], 15.0)
                    Spacer()
                    Text("\(tripsCount) available itineraries")
                        .shadow(color: Color("BackgroundColor"), radius: 4)
                        .font(.caption)
                        .fontWeight(.regular)
                        .padding([.top, .trailing], 15.0)
                }
                Spacer()
                
                
            }
        }.padding(.horizontal)

        
    }
    
}


#Preview {
    LargePlaceView(image: Image("paris"), place: "Paris", tripsCount: 523)
}
