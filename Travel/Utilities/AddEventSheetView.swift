//
//  AddEventSheetView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/4/24.
//
import SwiftUI

struct AddEventSheetView: View {
    @Environment(\.managedObjectContext) private var moc
    @ObservedObject var day: DayPlan
    
    @Binding var isSheetShowing: Bool
    
    @State var name: String = ""
    @State var desc: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Event")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            
            TextField("Event e.g. Guided Tour, Arriving at Hotel", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
            
            TextField("Description e.g. \"Pick up passes at museum entrance\" ", text: $desc)
                .padding().padding(.bottom, 50)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
            
            // Add Event Button
            Button(action: {
                let event = EventDetails(context: moc)
                
                event.desc = desc
                event.name = name
                
                day.addEvent(event)
                
                saveContext()
                
                isSheetShowing = false
            }) {
                Text("Add Event")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 50.0)
                    .padding(.vertical, 15.0)
                    .background(Color("AppColor"))
                    .cornerRadius(30)
            }
        }
        .padding()
    }
    
    private func saveContext() {
        do {
            if moc.hasChanges {
                try moc.save()
            }
        } catch {
            print(error)
        }
    }
}
