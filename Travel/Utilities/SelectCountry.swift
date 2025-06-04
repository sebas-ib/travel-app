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
            VStack {
                HStack{
                    Text("Add Country").font(.headline)
                        .foregroundStyle(Color("AppColor"))
                    Text("e.g. France, Mexico, Italy").foregroundStyle(.gray)
                        .padding(.vertical)
                    Spacer()
                }.padding(.leading, 15)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.black.opacity(0.35), lineWidth: 1)
            ).padding(10)
        }
    }
}

struct SelectCountry_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            let preview = ItinerariesProvider.shared

            @State var location: String = "France"

            SelectCountry()
        }
    }
}

