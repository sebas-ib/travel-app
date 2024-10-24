//
//  SelectCountry.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/21/24.
//
import SwiftUI

struct SelectCountry: View {    
    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.white)
                .frame(height: 40)
                .padding(.horizontal,20)
                .shadow(radius: 2.5)
            
            VStack {
                HStack{
                    Text("Add Country").font(.headline)
                        .foregroundStyle(Color("AppColor"))
                    Text("e.g. France, Mexico, Italy").foregroundStyle(.gray)
                        .padding(.vertical)
                    Spacer()

                }.padding(.horizontal, 35)
            }
        }
    }
}

struct SelectCountry_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = ItinerariesProvider.shared
            
            @State var location: String = "France"

//            SelectCountry(place: $location)
        }
    }
}

