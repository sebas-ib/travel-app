//
//  SavedItineraryView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/21/24.
//
import SwiftUI

struct SavedItineraryView: View {
    let itinerary: Itinerary
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(itinerary.name)
                    .font(.title3)
                    .bold()
                Text(dateRange(itinerary.arrivalDate, itinerary.departureDate))
                    .font(.caption2)
            }
            .padding()
            Spacer()
        }
//        .background(
//            RoundedRectangle(cornerRadius: 15, style: .continuous)
//                .stroke(Color.black.opacity(0.35), lineWidth: 1)
//        )
    }
    
    
    private func dateRange(_ arrival: Date,_ departure: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        
        let arrivalDate = dateFormatter.string(from: arrival)
        let departureDate = dateFormatter.string(from: departure)
        
        return "\(arrivalDate) - \(departureDate)"
    }
}



struct SavedItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        SavedItineraryView(itinerary: .preview())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
