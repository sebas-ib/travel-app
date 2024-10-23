//
//  SelectedCountry.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/21/24.
//
import SwiftUI

struct SelectedCity: View {
    @Binding var place: String
    
    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .frame(height: 40)
                .padding(.trailing,20)
                .shadow(radius: 1)
            
            VStack {
                HStack{
                    if place == "" {
                            Text("Add City?").font(.headline)
                            .padding([.top, .bottom]).foregroundStyle(Color("AppColor"))
                            Text("e.g. New York, Paris, Rome").foregroundStyle(.gray)
                            .padding(.vertical)

                    }else {
                        Text("\(place)")
                            .font(.headline)
                            .foregroundStyle(Color("AppColor"))
                            .padding()
                    }
                    Spacer()

                }.padding(.horizontal)
            }
        }
    }
}

struct SelectedCity_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = ItinerariesProvider.shared
            
            @State var location: String = "France"

            SelectedCountry(place: $location)
        }
    }
}

