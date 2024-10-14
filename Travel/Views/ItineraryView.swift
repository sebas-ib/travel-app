//
//  ItineraryView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import SwiftUI

struct ItineraryView: View {
    
    let itinerary : ItineraryDetails
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView(.vertical){
                VStack(alignment: .center) {
                    Text("\(itinerary.city)").font(.largeTitle).fontWeight(.heavy)
                    
                    Text("\(formattedDate(itinerary.startDate)) -  \(formattedDate(itinerary.endDate))")
                        .font(.caption)
                    
                    Text("\(timeBetweenDates(start: itinerary.startDate, end: itinerary.endDate)) Days")
                        .font(.caption)
                    
                }
                
            }
            .safeAreaPadding(.top,100)
            .safeAreaPadding(.bottom,30)
            .scrollIndicators(.hidden)
            
            NavBar(topNavBar: true, search: false, settings: false, back: true, title: "Itinerary")
            
        }.navigationBarBackButtonHidden(true)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium  // You can adjust the style (short, medium, long, etc.)
        formatter.dateFormat = "MMM d"
        return formatter.string(from: date)
    }
    
    func timeBetweenDates(start: Date, end: Date) -> Int {
        let interval = end.timeIntervalSince(start)
        
        let days = Int(interval) / (24 * 3600)

        
        return days
    }
}

#Preview {
    ItineraryView(itinerary: itineraries[0])
}
