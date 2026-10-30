//
//  ContentView.swift
//  SmartLocation
//
//  Created by MAY 03 on 26/10/26.
//
import CoreLocation
import SwiftUI
@ViewBuilder
private func statusRow(title: String, value: String) -> some View {
    HStack {
        Text(title + ":")
            .font(.body)
        Spacer()
        Text(value)
            .font(.body)
            .foregroundStyle(.secondary)
    }
}


struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "location.circle.fill")
                    .font(.system(size: 65))
                    .foregroundStyle(.pink)
                Text("Location Services")
                    .font(.custom("Georgia", size: 50))
                    .foregroundStyle(.pink)
                Group{
                    statusRow(title: "Services enabled", value: locationManager.servicesEnabled ? "Yes" : "No")
                    statusRow(title: "Permission", value: permissionText)
                    
                }
                Button("Request Location Permission"){
                    locationManager.requestPermission()
                }
                .buttonStyle(.borderedProminent)
                .disabled(locationManager.authorizationStatus != .notDetermined)
                Button("Refresh Status"){
                    locationManager.refreshStatus()
                }
                .buttonStyle(.bordered)
            }
                .padding(40)
                .navigationBarTitle("Smart Location")
                .onAppear {
                    locationManager.refreshStatus()
                
            }
        }
    }
    @ViewBuilder
    private func statusRow(title: String, value: String) -> some View {
        HStack {
            Text(title + ":")
                .font(.body)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundStyle(.secondary)
        }
    }
    private var permissionText: String {
            switch locationManager.authorizationStatus {
            case .notDetermined: return "Not Determined"
            case .restricted: return "Restricted"
            case .denied: return "Denied"
            case .authorizedWhenInUse: return "Authorized"
            case .authorizedAlways: return "Authorized Always"
            @unknown default: return "Unknown"
            }
        }
}

#Preview {
    ContentView()
}


