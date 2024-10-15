////
////  SmallPlaceView.swift
////  Travel
////
////  Created by Sebastian Ibarra on 10/14/24.
////
//
//import SwiftUI
//
//struct SmallPlaceView : View {
//    let itinerary : ItineraryDetails
//        
//    var body : some View {
//        ZStack {
//            VStack(spacing: 0.0) {
//                itinerary.image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 75, height: 75)
//                    .clipShape(Circle())
//                
//                
//                Text(itinerary.cities.count == 1 ? itinerary.cities[0] : itinerary.countries[0])
//                    .font(.caption2)
//                    .fontWeight(.regular)
//            }
//            Spacer()
//        }
//    }
//}
//
