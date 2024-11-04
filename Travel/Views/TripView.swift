//
//  TripView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import SwiftUI

struct TripView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @ObservedObject var itinerary: Itinerary
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        
                        Spacer()
                        
                        ForEach(itinerary.daysArray){ day in
                            DayPlanView(day: day)
                        }
                        
                    }
                    .padding(.top, 65)
                    .scrollIndicators(.hidden)
                }
                .navigationBarBackButtonHidden(true)
                
                NavBar(topNavBar: true, search: false, settings: false, back: true, title: "Itinerary")
            }
        }
    }
}

private extension TripView {
    
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MM/dd"
        
        
        let formattedDate = dateFormatter.string(from:date)
        
        return formattedDate
    }
    
    func toggleSaved() {
        itinerary.saved.toggle()
        do {
            if moc.hasChanges{
                try moc.save()
            }
        } catch {
            print(error)
        }
    }
    
}

struct TripView_Previews: PreviewProvider {
    static var previews : some View{
        TripView(itinerary: .preview())
    }
}
