
import SwiftUI

struct AddOrderView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedRestaurantId: UUID = restaurants.first?.id ?? UUID()
    @State var customerName: String = ""
    @State var deliveryAddress: String = ""
    @State var lat: String = ""
    @State var lon: String = ""
    
    var onSave: (Order) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Thông tin quán")) {
                    Picker("Chọn quán Matcha", selection: $selectedRestaurantId) {
                        ForEach(restaurants) { res in
                            Text(res.name).tag(res.id)
                        }
                    }
                }
                
                Section(header: Text("Thông tin giao hàng")) {
                    TextField("Tên khách hàng", text: $customerName)
                    TextField("Địa chỉ giao hàng", text: $deliveryAddress)
                    
                    TextField("Latitude", text: $lat)
                        .keyboardType(.decimalPad)
                    
                    TextField("Longitude", text: $lon)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Thêm đơn hàng")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Thêm") {
                        if let latt = Double(lat),
                           let long = Double(lon),
                           !customerName.isEmpty,
                           !deliveryAddress.isEmpty {
                            
                            let newOrder = Order(
                                idRestaurant: selectedRestaurantId,
                                customerName: customerName,
                                address: deliveryAddress,
                                latitude: latt,
                                longitude: long,
                                status: "Chưa giao"
                            )
                            
                            onSave(newOrder)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddOrderView(onSave: { newOrder in
        
    })
}
