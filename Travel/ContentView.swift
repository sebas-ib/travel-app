//
//  ContentView.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [AppView] = []

    var body: some View {
        
            HomeView(path: $path)
                .navigationDestination(for: AppView.self) { view in
                    switch view {
                    case .home:
                        HomeView(path: $path)
                    }
                }
        
    }
}

#Preview {
    ContentView()
}
