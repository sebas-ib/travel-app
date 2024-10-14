//
//  AccountView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            
            Color("BackgroundColor").ignoresSafeArea()
            Text("Account") // Displays the message
                .font(.largeTitle)
                .padding()

        }
    }
}

#Preview {
    AccountView()
}
