//
//  AccountView.swift
//  Week3
//
//  Created by MAY 03 on 9/10/26.
//Nam Phương

import SwiftUI

struct AccountView: View {
    var body: some View {
        HStack{
            Image("ava")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())

            VStack(alignment: .leading){
                Text("Nmai Napu")
                    .font(.custom("Georgia-Bold", size: 20))
                    .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                    .bold()
                Text("Quận 3, Thành phố Hồ Chí Minh")
                    .font(.custom("Georgia", size: 15))
                
            }
        }
    }
}

#Preview {
    AccountView()
}
