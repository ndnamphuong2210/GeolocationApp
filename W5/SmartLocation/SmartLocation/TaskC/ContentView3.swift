//
//  ContentView3.swift
//  SmartLocation
//
//  Created by MAY 03 on 26/10/26.
//

import SwiftUI
import CoreLocation

struct ContentView3: View {
    @StateObject private var locationManager = LocationManager3()

    var body: some View {
        VStack(spacing: 16) {
            Text("Smart Location Tracker")
                .font(.title2).bold()

            HStack {
                Circle()
                    .fill(locationManager.isTracking ? Color.green : Color.gray)
                    .frame(width: 10, height: 10)
                Text(locationManager.isTracking ? "Tracking Active" : "Not Tracking")
                    .font(.headline)
            }
            .padding(.vertical, 4)

            VStack(alignment: .leading, spacing: 8) {
                Text("Latitude: \(locationManager.currentLocation?.coordinate.latitude ?? 0)")
                Text("Longitude: \(locationManager.currentLocation?.coordinate.longitude ?? 0)")
                Text("Accuracy: ± \(locationManager.currentLocation?.horizontalAccuracy ?? 0, specifier: "%.1f") m")
                Text("Last update: \(locationManager.lastUpdateTime?.formatted() ?? "-")")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)

            HStack(spacing: 16) {
                VStack(alignment: .leading) {
                    Text("Total Distance").font(.caption).foregroundColor(.secondary)
                    Text(String(format: "%.1f m", locationManager.totalDistance))
                        .font(.title3).bold().foregroundColor(.blue)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Last Movement").font(.caption).foregroundColor(.secondary)
                    Text(String(format: "%.1f m", locationManager.lastDistance))
                        .font(.title3).bold().foregroundColor(.green)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.05))
            .cornerRadius(8)

            Spacer()

            HStack(spacing: 12) {
                if locationManager.isTracking {
                    Button(action: {
                        locationManager.stopTracking()
                    }) {
                        Label("Stop Tracking", systemImage: "stop.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                } else {
                    Button(action: {
                        locationManager.resetDistance()
                        locationManager.startTracking()
                    }) {
                        Label("Start Tracking", systemImage: "play.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView3()
}
