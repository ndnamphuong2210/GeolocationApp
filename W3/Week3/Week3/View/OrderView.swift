//
//  OrderView.swift
//  Week3
//Nam Phuong

import SwiftUI

struct OrderView: View {
    @State private var selectedStatus: OrderStatus = .pending

    var filteredOrders: [Order] {
        orders.filter { $0.status == selectedStatus }
    }

    var body: some View {
        VStack(spacing: 12) {
            Picker("Status", selection: $selectedStatus) {
                ForEach(OrderStatus.allCases, id: \.self) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(.palette)
            .padding(.horizontal)

            ScrollView {
                VStack(spacing: 12) {
                    if filteredOrders.isEmpty {
                        Text("Không có đơn hàng nào")
                            .font(.custom("Georgia", size: 14))
                            .foregroundColor(.gray)
                            .padding(.top, 40)
                    } else {
                        ForEach(filteredOrders) { order in
                            let total = order.items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) } + order.shippingfee
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Đơn hàng #\(order.id.uuidString.prefix(4))")
                                        .font(.custom("Georgia-Bold", size: 14))
                                    Spacer()
                                    Text(order.status.rawValue)
                                        .font(.custom("Georgia", size: 12))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.pink.opacity(0.15))
                                        .cornerRadius(6)
                                }

                                Divider()

                                ForEach(order.items) { item in
                                    HStack {
                                        Text("\(item.product.name) x\(item.quantity)")
                                            .font(.custom("Georgia", size: 13))
                                        Spacer()
                                        Text("\(Int(item.product.price).formatted()) đ")
                                            .font(.custom("Georgia", size: 13))
                                    }
                                }

                                Divider()

                                HStack {
                                    Spacer()
                                    Text("Tổng: \(Int(total).formatted()) đ")
                                        .font(.custom("Georgia-Bold", size: 14))
                                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                                }
                            }
                            .padding(12)
                            .background(Color.white)
                            .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.pink.opacity(0.025).ignoresSafeArea())
    }
}

#Preview {
    OrderView()
}
