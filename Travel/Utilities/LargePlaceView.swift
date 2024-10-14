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
            image.resizable()
                .scaledToFill()
                .frame(height: 200, alignment: .center)
                .clipped().cornerRadius(20)
            VStack {
                HStack(alignment: .top){
                    Text("Trips to \(place)")
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 8)
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding([.top, .leading], 15.0)
                    Spacer()
                    Text("\(tripsCount) available itineraries")
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 8)
                        .font(.caption)
                        .fontWeight(.regular)
                        .padding([.top, .trailing], 15.0)
                }
                Spacer()
            }
        }

        
    }
    
}


#Preview {
    LargePlaceView(image: Image("paris"), place: "Paris", tripsCount: 523)
}
