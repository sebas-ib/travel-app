//
//  DayPlanView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 11/1/24.
//

import SwiftUI

struct DayPlanView: View {
    @State var name: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 100)
                .foregroundStyle(.white)
                .shadow(radius: 1)
                .padding(.horizontal,10)
            
            HStack{
                Text(name)
                    .font(.largeTitle)
                    .bold()
                                
                Spacer()
                
                Image(systemName: "chevron.down")

            }
            .padding(25)
            
        }
    }
}

#Preview {
    DayPlanView(name: "Fri 1/11")
}
