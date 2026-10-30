//
//  HomeView.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    @ObservedObject var locationManager: LocationManager5
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Smart Location Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.systemMint))
                        .shadow(color: .white, radius: 1, x: -1, y: -1)
                        .shadow(color: .white, radius: 1, x: 1, y: -1)
                        .shadow(color: .white, radius: 1, x: -1, y: 1)
                        .shadow(color: .white, radius: 1, x: 1, y: 1)
                        
                    
                    VStack(spacing: 12) {
                        HStack {
                            Image(systemName: "location.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(Color(.systemMint))
                            Spacer()
                        }
                        
                        InfoView(
                            title: "Latitude",
                            value: locationManager.currentLocation != nil ? String(format: "%.4f", locationManager.currentLocation!.coordinate.latitude) : "--"
                        )
                        InfoView(
                            title: "Longitude",
                            value: locationManager.currentLocation != nil ? String(format: "%.4f", locationManager.currentLocation!.coordinate.longitude) : "--"
                        )
                        InfoView(
                            title: "Accuracy",
                            value: String(format: "%.1f m", locationManager.accuracy)
                        )
                        InfoView(
                            title: "Permission",
                            value: authorizationString(for: locationManager.authorizationStatus),
                            valueColor: isAuthorized(locationManager.authorizationStatus) ? .green : .red
                        )
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground).opacity(0.9)))
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            locationManager.requestPermission()
                            locationManager.startUpdatingLocation()
                        }) {
                            Label("Start", systemImage: "play.fill")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.mint)
                        
                        Button(action: {
                            locationManager.stopUpdatingLocation()
                        }) {
                            Label("Stop", systemImage: "stop.fill")
                        }
                        .buttonStyle(.bordered)
                        .tint(.mint)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    private func authorizationString(for status: CLAuthorizationStatus) -> String {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            return "Authorized"
        case .denied:
            return "Denied"
        case .restricted:
            return "Restricted"
        case .notDetermined:
            return "Not Determined"
        @unknown default:
            return "Unknown"
        }
    }
    
    private func isAuthorized(_ status: CLAuthorizationStatus) -> Bool {
        return status == .authorizedWhenInUse || status == .authorizedAlways
    }
}

#Preview {
    HomeView(locationManager: LocationManager5())
}
