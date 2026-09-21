//
//  MainView.swift
//  Week2A
//
//  Created by MAY 03 on 21/9/26.
//

import SwiftUI

struct MainView: View {
    var name: String = "HCMIU"
    var latitude: Double = 10.8703
    var longitude: Double = 106.8028
    
    var body: some View {
        VStack{
            Text("Napu's places")
                .font("Georgia")
        }
        
    }
}

#Preview {
    MainView()
}
