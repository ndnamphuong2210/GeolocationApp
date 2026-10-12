//
//  MenuView.swift
//  Week3
//
//  Created by MAY 03 on 9/10/26.
//Nam Phuong

import SwiftUI

struct MenuView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            Group {
                switch selectedTab {
                case 0:
                    ContentView()
                case 1:
                    CateView()
                case 2:
                    OrderView()
                case 3:
                    AccountView()
                default:
                    EmptyView()
                }
            }
            .frame(maxHeight: .infinity)

            HStack {
                Button {
                    selectedTab = 0
                } label: {
                    VStack {
                        Image(systemName: "house.fill")
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                        Text("Menu")
                            .font(.custom("Georgia", size: 15))
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                    }
                }
                .offset(x: -10)
                
                Button {
                    selectedTab = 1
                } label: {
                    VStack {
                        Image(systemName: "square.grid.2x2.fill")
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                        Text("Danh mục")
                            .font(.custom("Georgia", size: 15))
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                    }
                }
                
                Button {
                    selectedTab = 2
                } label: {
                    VStack {
                        Image(systemName: "folder.fill")
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                        Text("Đơn hàng")
                            .font(.custom("Georgia", size: 15))
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                    }
                }
                
                Button {
                    selectedTab = 3
                } label: {
                    VStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                        Text("Tài khoản")
                            .font(.custom("Georgia", size: 15))
                            .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.pink.opacity(0.04))
            .background(Color.pink.opacity(0.04))
        }
    }
}

#Preview {
    MenuView()
}
