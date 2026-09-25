//
//  MainView.swift
//  Week2HomeWork
//
//  Created by MAY 03 on 21/9/26.
//

import SwiftUI

struct MainView: View {
    @State private var r = restaurants
    @State private var o = orders

    var body: some View {
        NavigationStack {
            VStack {
                Text("Đơn hàng cần giao")
                    .font(.custom("Georgia", size: 35))
                    .bold()
                    .foregroundStyle(Color.pink)

                List(o.indices, id: \.self) { index in
                    let order = o[index]
                    let res = r.first(where: { $0.id == order.idRestaurant })
                    
                    let sColor: Color = {
                        switch order.status {
                        case "Đang giao":
                            return .orange
                        case "Đã giao":
                            return .yellow
                        default:
                            return .blue
                        }
                    }()

                    NavigationLink(destination: MapView(order: $o[index])) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(res?.name ?? "Quán Matcha")
                                .font(.custom("Georgia", size: 20))
                                .foregroundColor(.pink)

                            Text(res?.adress ?? "")
                                .font(.custom("Georgia", size: 15))
                                .foregroundColor(.pink)

                            Text("Giao cho: \(order.customerName)")
                                .font(.custom("Georgia", size: 15))
                                .foregroundColor(.brown)

                            Text("Địa chỉ: \(order.deliveryAddress)")
                                .font(.custom("Georgia", size: 15))
                                .foregroundColor(.brown)

                            Text(order.status)
                                .font(.caption)
                                .bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(sColor.opacity(0.2))
                                .foregroundColor(sColor)
                                .cornerRadius(8)
                        }
                    }
                }

                NavigationLink(destination: AddOrderView(onSave: { newOrder in
                    o.append(newOrder)
                })) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add order nè")
                            .font(Font.custom("Georgia", size: 20))
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color(red: 0.1, green: 0.9, blue: 0.95))
                .foregroundStyle(Color.white)
                .cornerRadius(20)
                .buttonStyle(.plain)
                .frame(width: 300)

                Text("Total orders: \(o.count)")
                    .font(Font.custom("Georgia", size: 20))
                    .foregroundStyle(Color.pink)
            }
        }
    }
}

#Preview {
    MainView()
}
