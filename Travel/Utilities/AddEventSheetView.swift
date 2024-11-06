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
                FormTextField(title: "Event Name", text: $name, placeholder: "Guided Tour, Arriving at Hotel")
                FormTextEditor(title: "Event Description", text: $desc, placeholder: "- Explore Museum\n- Check out Restaurant")
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

struct FormTextField: View{
    let title: String
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        
        Text(title)
            .font(.caption2)
            .bold()
        
        TextField(placeholder, text: $text)
            .padding(5.0)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black.opacity(0.35), lineWidth: 1)
            ).padding(.bottom,4)
    }
}

struct FormTextEditor: View {
    let title: String
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption2)
                .bold()
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                    .background(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.black.opacity(0.35), lineWidth: 1)
                    )
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color("Placeholder")).padding(.top,8)
                            .padding(.leading,5)
                }
            }
        }
    }
}



struct AddEventSheetView_Previews: PreviewProvider {
    @State static var isSheetShowing = true
    
    static var previews: some View {
        let context = ItinerariesProvider.shared.viewContext
        let day = DayPlan(context: context) // Mock DayPlan object
        
        AddEventSheetView(day: day, isSheetShowing: $isSheetShowing)
            .environment(\.managedObjectContext, context)
    }
}
