//
//  CartView.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//

import SwiftUI

struct CartView: View {
    var items: [CartItem] = cartItems1
    var totalPrice: Double {
            items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    var body: some View {
        NavigationStack {
            VStack {
                if items.isEmpty {
                        ContentUnavailableView("Giỏ hàng trống", systemImage: "cart")
                } else {
                    List {
                        ForEach(items) { item in
                            HStack(spacing: 12) {
                                Image(item.product.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                VStack(alignment: .leading, spacing: 4) {Text(item.product.name).font(.headline).lineLimit(1)
                                        
                                    Text("\(Int(item.product.price)) đ")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    }
                                    
                                Spacer()
                                    
                                Text("x\(item.quantity)")
                                    .font(.subheadline)
                                    .bold()
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.pink.opacity(0.1))
                                    .clipShape(Capsule())
                                }
                            }
                        }
                        .listStyle(.plain)
                        
                        VStack(spacing: 12) {
                            HStack {
                                Text("Tổng cộng:")
                                    .font(.headline)
                                Spacer()
                                Text("\(Int(totalPrice)) đ")
                                    .font(.title3)
                                    .bold()
                                    .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                            }
                            
                            Button(action: {
                            }) {
                                Text("Thanh toán")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color(red: 1.0, green: 0.45, blue: 0.69))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.05))
                    }
            }
                .navigationTitle("Giỏ hàng")
        }
    }
        
       
    
}

#Preview {
    CartView()
}
