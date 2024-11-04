//
//  DayPlanView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/1/24.
//
import SwiftUI

struct DayPlanView: View {
    let day: DayPlan
    
    
    @State var showInfo: Bool = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(formatDate(day.date))
                        .font(.title)
                        .bold()
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showInfo.toggle()
                        }
                    } label: {
                        Image(systemName: "chevron.down")
                            .rotationEffect(showInfo ? .degrees(180) : .degrees(0))
                    }
                    .padding(.vertical)
                }
                
                // Animated content height
                VStack {
                    if showInfo {
                        if day.dayPlan == "" {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add an event")
                            }
                        } else{
                            Text(day.dayPlan)
                        }
                    }
                }
            }
            .padding(25)
            .clipped()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 5)

        }
    }
}

private extension DayPlanView {
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE MM/dd"
        
        let formattedDate = dateFormatter.string(from:date)
        
        return formattedDate
    }
}
