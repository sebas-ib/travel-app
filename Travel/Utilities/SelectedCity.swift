//
//  SelectCountry.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/21/24.
//
import SwiftUI

struct SelectedCity: View {
    @Binding var place: City
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "arrow.turn.down.right")
                    .foregroundStyle(Color("AppColor"))
                    .padding(.leading, 40.0)
                    .font(.title)
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.white)
                    .frame(height: 40)
                    .padding(.trailing,20)
                    .shadow(radius: 1)
            }
            HStack{
                if place.cityName == "" {
                    Text("Add City?").font(.headline)
                        .foregroundStyle(Color("AppColor"))
                    Text("e.g. New York, Paris")
                        .foregroundStyle(.gray)
                    
                }else {
                    Text("\(place.cityName)")
                        .font(.headline)
                        .foregroundStyle(Color("AppColor"))
                }
                Spacer()
                
            }.padding(.leading, 95)
        }
    }
}

struct SelectedCity_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
//            let preview = ItinerariesProvider.shared
            
//            @State var location: Country
            
//            SelectedCity(place: $location)
        }
    }
}

