//
//  SelectedCountry.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/21/24.
//
import SwiftUI

struct SelectedCountry: View {
    @Binding var place: String
    
    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .frame(height: 40)
                .padding(.horizontal,20)
                .shadow(radius: 2.5)
            
            VStack {
                HStack{
                    if place == "" {
                            Text("Add Country").font(.headline)
                            .padding([.top, .leading, .bottom]).foregroundStyle(Color("AppColor"))
                            Text("e.g. France, Mexico, Italy").foregroundStyle(.gray)
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

struct SelectedCountry_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = ItinerariesProvider.shared
            
            @State var location: String = "France"

            SelectedCountry(place: $location)
        }
    }
}

