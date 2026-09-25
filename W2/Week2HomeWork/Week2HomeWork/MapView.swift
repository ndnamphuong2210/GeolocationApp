

import SwiftUI
import MapKit

struct MapView: View {
    @Binding var order: Order
    var reslist: [Restaurant] = restaurants
    
    var res: Restaurant? {
        reslist.first(where: { $0.id == order.idRestaurant })
    }
    
    var respos: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: res?.latitude ?? 10.8035, longitude: res?.longitude ?? 106.7145)
    }
    
    var userpos: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: order.latitude, longitude: order.longitude)
    }
    
    @State private var pos: MapCameraPosition = .automatic
    @State private var line: MKRoute?
    @State private var dist: Double = 0.0
    @State private var time: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Map(position: $pos) {
                Marker(res?.name ?? "Quán", systemImage: "fork.knife", coordinate: respos)
                    .tint(.red)
                
                Marker("User's location", systemImage: "house.fill", coordinate: userpos)
                    .tint(.blue)
                
                if let line = line {
                    MapPolyline(line.polyline)
                        .stroke(.blue, lineWidth: 5)
                }
            }
            .frame(height: 380)
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            
            VStack(alignment: .leading, spacing: 14) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(res?.name ?? "Quán Matcha")
                        .font(.custom("Georgia", size: 20))
                    Text(res?.adress ?? "")
                        .font(.custom("Georgia", size: 20))
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("To: \(order.customerName)")
                        .font(.custom("Georgia", size: 20))
                        .foregroundColor(.pink)
                    Text(order.deliveryAddress)
                        .font(.custom("Georgia", size: 20))
                        .foregroundColor(.pink)
                }
                
                VStack(alignment: .leading) {
                    if dist > 0 {
                        Text(String(format: "Distance: %.1f km (≈ %d phút)", dist, time))
                            .font(.custom("Georgia", size: 20))
                    } else {
                        Text("Loading...")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
        }
        .navigationTitle("Chi tiết đơn hàng")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getroute(from: respos, to: userpos) { route, d, t in
                self.line = route
                self.dist = d
                self.time = Int(t)
                
                if let poly = route?.polyline {
                    self.pos = .rect(poly.boundingMapRect)
                }
            }
        }
    }
    
    func getroute(from source: CLLocationCoordinate2D,
                  to destination: CLLocationCoordinate2D,
                  completion: @escaping (MKRoute?, Double, TimeInterval) -> Void) {
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: source))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        req.transportType = .automobile
        
        let dir = MKDirections(request: req)
        dir.calculate { res, err in
            if let r = res?.routes.first {
                let d = r.distance / 1000
                let t = r.expectedTravelTime / 60
                completion(r, d, t)
            } else {
                completion(nil, 0, 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MapView(order: .constant(orders[0]))
    }
}
