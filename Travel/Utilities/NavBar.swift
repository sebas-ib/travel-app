//
//  NavBar.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct NavBar: View {
    @Environment(\.dismiss) var dismiss

    
    let topNavBar: Bool
    let search: Bool
    let settings: Bool
    
    let back: Bool
    
    let title: String
    
    @State private var searchText = ""
    @FocusState private var isSearching: Bool
    
    
    
    var body: some View {
        ZStack{
            
            VStack {
                if topNavBar{
                    HStack {
                        
                        if back {
                            Button(action: {
                                dismiss()
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left") // Back arrow icon
                                        .font(.title).foregroundStyle(Color("TextColor"))
                                }
                            }
                        }
                        
                        
                        if title != "" {
                            Text(title)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(Color("TextColor"))
                            Spacer()
                            
                            
                        }
                        
                        if search {
                            HStack(alignment: .center){
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(Color("TextColor"))
                                    .padding(.leading, 10)
                                    .font(.title3)
                                
                                TextField("", text: $searchText).autocorrectionDisabled(true)
                                    .textInputAutocapitalization(.never)
                                    .frame(height: 40.0)
                                    .focused($isSearching)
                                Spacer()
                            }
                            .background(Color("TextColor").opacity(0.10))
                            .cornerRadius(20)
                            .padding(.horizontal, 3)
                        }
                        
                        if settings {
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gearshape")
                                    .foregroundStyle(Color("TextColor"))
                                    .font(.title3)
                            }
                        }
                        
                        
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                }
                
                Spacer()
//                
//                HStack {
//                    Spacer()
//                }.padding(.vertical, 5.0)
//                .background(.ultraThinMaterial)
            }
        }
    }
}
//
//
//
//
//#Preview {
//    NavBar(topNavBar: true, search: true, settings: true, back: true, title: "Discover")
//}
