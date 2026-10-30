//
//  InfoView.swift
//  SmartLocation
//
//  Created by MAY 03 on 30/10/26.
//

import SwiftUI

struct InfoView: View {
    let title: String
    let value: String
    var valueColor: Color = .primary
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(Color(.brown))
                    .bold()
                Spacer()
                Text(value)
                    .foregroundStyle(Color(.systemMint))
            }
            .padding(.vertical, 4)
            Divider()
        }
    }
}

#Preview {
    InfoView(title: "Latitude", value: "10.8506")
}
