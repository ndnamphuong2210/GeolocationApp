//
//  AddPlaceView.swift
//  Week2A
//
//  Created by MAY 03 on 21/9/26.
//

import SwiftUI

struct AddPlaceView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var lat: String = ""
    @State var lon: String = ""
    
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Place info")){
                    TextField("Name", text: $name)
                    TextField("Latitude", text: $lat)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $lon)
                        .keyboardType(.decimalPad)
                }
            }
                .navigationTitle(Text("Add place"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){dismiss()}
                    }
                    ToolbarItem(placement: .confirmationAction){
                        Button("Add"){
                            if let latt = Double(lat),
                               let long = Double(lon), !name.isEmpty {
                                let np = Location(name: name, lat: latt, lon: long)
                                onSave(np)
                                dismiss()
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    AddPlaceView(onSave: { newLocation in
       
    })
}
