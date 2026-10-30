//
//  ContentView.swift
//  SmartLocationTaskE
//
//  Created by MAY 03 on 26/10/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager: LocationManager
    @State private var places: [Place] = []
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
