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
        VStack{
            Text("New Event")
                .font(.title2)
                .bold()
            
            VStack(alignment: .leading) {
                Text("Event Name")
                    .font(.caption2)
                    .bold()
                
                
                TextField("Guided Tour, Arriving at Hotel", text: $name)
                    .padding(5.0)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black.opacity(0.35), lineWidth: 1)
                    ).padding(.bottom,4)
                
                Text("Event Description")
                    .font(.caption2)
                    .bold()
                ZStack{
                    TextEditor(text: $desc)
                        .background(Color(.systemGray6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black.opacity(0.35), lineWidth: 1)
                        )
                    if desc == "" {
                        VStack(alignment: .leading){
                            HStack{
                                Text("  - Explore Museum\n  - Check out Restaurant")
                                    .foregroundStyle(Color.black.opacity(0.20))
                                Spacer()
                            }.padding(.leading, 4.25)
                            
                            Spacer()
                        }
                        .padding(.top, 8.5)
                    }
                }
            }
            
            // Add Event Button
            if name != "" {
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
                }.padding()
            } else {
                Text("Add Event")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 50.0)
                    .padding(.vertical, 15.0)
                    .background(Color.gray)
                    .cornerRadius(30)
                    .padding()
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

