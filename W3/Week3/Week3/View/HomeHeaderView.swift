//
//  HomeHeaderView.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//Nam Phuong

import SwiftUI

struct HomeHeaderView: View {
    var storename: String = "ngon ká"
    var slogan: String = "một tay nhiều ká"
    @State private var showCart = false
    
    var body: some View {

        HStack{
            Image("lg")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .offset(x: -20)
            VStack(alignment: .leading){
                Text(storename)
                    .font(.custom("Georgia", size: 30))
                    .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                    .bold()
                Text(slogan)
                    .font(.custom("Georgia", size: 20))
                    .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                    .bold()
                
            }.offset(x: -15)
            Button{} label:{
                ZStack{
                    Image(systemName: "bell")
                        .font(.custom("Georgia", size: 30))
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 30, height: 30)
                        .overlay(Text("1").font(.caption2).foregroundColor(.white).padding(5).background(Circle().fill(Color.pink)))
                        .offset(x:8, y:-8)
                    
                }
            }.offset(x: 20)
            Button{showCart = true} label:{
                ZStack{
                    Image(systemName: "cart")
                        .font(.custom("Georgia", size: 30))
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 30, height: 30)
                        .overlay(Text("1").font(.caption2).foregroundColor(.white).padding(5).background(Circle().fill(Color.pink)))
                        .offset(x:8, y:-8)
                    
                }
            }.offset(x: 20)
        }
        .padding(30)
        .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.pink.opacity(0.04))
        ).navigationDestination(isPresented: $showCart) {
            CartView()
        }
    }
}

#Preview {
    HomeHeaderView()
}
