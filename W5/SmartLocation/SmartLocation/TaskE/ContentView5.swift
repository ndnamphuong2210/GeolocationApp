//
//  ContentView5.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import SwiftUI

struct ContentView5: View {
    @StateObject private var locationManager = LocationManager5()
    
    var body: some View {
        TabView {
            HomeView(locationManager: LocationManager5())
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ContentView4()
                .tabItem {
                    Label("Map", systemImage: "map.fill")
                }
            
            SavedPlaceView(locationManager: locationManager)
                .tabItem {
                    Label("Saved Places", systemImage: "list.bullet")
                }
        }
        .tint(.mint)
    }
}

#Preview {
    ContentView5()
}
