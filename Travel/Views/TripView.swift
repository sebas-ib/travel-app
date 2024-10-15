////
////  TripView.swift
////  Travel
////
////  Created by Sebastian Ibarra on 10/14/24.
////
//
//import SwiftUI
//
//struct TripView: View {
//    
//    let itinerary: ItineraryDetails
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color("BackgroundColor").ignoresSafeArea()
//
//                ScrollView(.vertical) {
//                    VStack(alignment: .leading) {
//                        itineraryImage
//                        
//                        itineraryTitle
//                        
//                        itineraryDetails
//                        
//                        ForEach(itinerary.activities, id: \.self) { day in
//                            DayPlanView(dayPlan: day)
//                        }
//                        
//                        Spacer().frame(height: 30) // Additional spacing at the bottom
//                    }
//                    .padding(.top, 65)
//                    .scrollIndicators(.hidden)
//                }
//                .navigationBarBackButtonHidden(true)
//
//                NavBar(topNavBar: true, search: false, settings: false, back: true, title: " ")
//            }
//        }
//    }
//    
//    // MARK: - Subviews
//    
//    private var itineraryImage: some View {
//        itinerary.image
//            .resizable()
//            .scaledToFill()
//            .frame(height: 200)
//            .clipped()
//    }
//    
//    private var itineraryTitle: some View {
//        Text(itinerary.cities.count == 1 ? itinerary.cities[0] : itinerary.countries[0])
//            .font(.largeTitle)
//            .fontWeight(.heavy)
//            .padding(.leading)
//    }
//    
//    private var itineraryDetails: some View {
//        let days = timeBetweenDates(start: itinerary.startDate, end: itinerary.endDate)
//        let cityCount = itinerary.cities.count
//        
//        return HStack(spacing: 2.5) {
//            Text("\(days) \(days == 1 ? "Day" : "Days")")
//                .font(.caption)
//            
//            Text("•")
//            
//            Text("\(cityCount) \(cityCount == 1 ? "City" : "Cities")")
//                .font(.caption)
//        }
//        .padding(.leading)
//    }
//    
//    // MARK: - Utility Functions
//
//    private func formattedDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.dateFormat = "MMM d"
//        return formatter.string(from: date)
//    }
//    
//    private func timeBetweenDates(start: Date, end: Date) -> Int {
//        let interval = end.timeIntervalSince(start)
//        return Int(interval) / (24 * 3600)
//    }
//}
//
