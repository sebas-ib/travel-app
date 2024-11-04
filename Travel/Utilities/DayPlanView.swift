//
//  DayPlanView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/1/24.
//
import SwiftUI

struct DayPlanView: View {
    @Environment(\.managedObjectContext) private var moc
    @ObservedObject var day: DayPlan
    
    @State private var isSheetShowing: Bool = false

    
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
                VStack(alignment: .leading) {
                    if showInfo {
                        
                        ForEach(day.eventsArray, id: \.self) { event in
                            Text(event.name)
                                .font(.subheadline)
                                .bold()
                            Text(event.desc)
                                .font(.body)
                                .padding(.bottom, 2)
                        }
                        
                        
                        HStack(alignment: .center) {
                            
                            Button {
                                isSheetShowing = true
                            } label: {
                                Image(systemName: "plus")
                                Text("Add an event")
                            }
                        }
                        
                        Rectangle()
                            .frame(height: 1.0)
                            .foregroundStyle(.gray)
                        TextField("Add notes here...", text: $day.dayPlan)
                            .onChange(of: day.dayPlan) {
                                saveContext()
                            }
                    }
                }
            }
            .padding(25)
            .clipped()
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 5)
            
        }
        .sheet(isPresented: $isSheetShowing) {
            AddEventSheetView(day: day ,isSheetShowing: $isSheetShowing)
        }
    }
    
    
    private func saveContext() {
        do {
            if moc.hasChanges{
                try moc.save()
            }
        } catch {
            print(error)
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
