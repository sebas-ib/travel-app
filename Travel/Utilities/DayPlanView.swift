//
//  DayPlanView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/14/24.
//

import SwiftUI

struct DayPlanView: View {
    let dayPlan: DayPlan

    var body: some View {
        textBox(dayPlan: dayPlan)
            .padding(.horizontal)
    }

    @ViewBuilder
    func textBox(dayPlan: DayPlan) -> some View {
        ZStack {

            VStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)

                Text("Day \(dayPlan.dayNum)")
                    .font(.headline)
                    .padding(.bottom, 5)

                // Sort events before using them in ForEach
                let sortedEvents = dayPlan.events.sorted { $0.eventTime < $1.eventTime }
                
                ForEach(sortedEvents, id: \.self) { event in // Use unique id for each event
                    EventRow(event: event)
                }
            }
            .padding(.horizontal,5)
            .background(Color.clear)
            .multilineTextAlignment(.leading)
        }
    }

    func extractTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}

struct EventRow: View {
    let event: Event // Assume Event is a model with properties: eventName, eventLocation, eventDesc, eventTime

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("• \(event.eventName) - \(event.eventLocation)").font(.footnote)
                Spacer()
                Text(extractTime(from: event.eventTime))
                    .font(.caption) // Smaller font for the time
            }
            Text("◦ \(event.eventDesc)")
                .padding(.leading, 25)
                .font(.caption2) // Smaller font for the description
        }
        .padding(.vertical, 2) // Add some vertical padding for better separation
    }

    func extractTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}

#Preview {
    DayPlanView(dayPlan: dayplans[0])
}
