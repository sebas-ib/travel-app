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
                        
                        Text(itinerary.city)
                        Spacer().frame(height: 30) // Additional spacing at the bottom
                        Button {
                            toggleSaved()
                        } label: {
                            Image(systemName: "bookmark")
                                .font(.title3)
                                .foregroundStyle(itinerary.saved ? .yellow : .gray.opacity(0.3))
                        }

                        
                    }
                    .padding(.top, 65)
                    .scrollIndicators(.hidden)
                }
                .navigationBarBackButtonHidden(true)
                
                NavBar(topNavBar: true, search: false, settings: false, back: true, title: " ")
            }
        }
    }
}

private extension TripView {
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
