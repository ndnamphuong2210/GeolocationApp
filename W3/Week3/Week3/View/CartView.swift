//
//  CartView.swift
//  Week3
//Nam Phưong

import SwiftUI

struct CartView: View {
    @State var items: [CartItem] = cartItems1
    @State private var selectedIDs: Set<UUID> = Set(cartItems1.map { $0.id })
    @State private var showAlert = false

    var totalPrice: Double {
        items
            .filter { selectedIDs.contains($0.id) }
            .reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if items.isEmpty {
                    ContentUnavailableView("Giỏ hàng trống", systemImage: "cart")
                } else {
                    HStack {
                        Button {
                            if selectedIDs.count == items.count {
                                selectedIDs.removeAll()
                            } else {
                                selectedIDs = Set(items.map { $0.id })
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: selectedIDs.count == items.count ? "checkmark.square.fill" : "square")
                                    .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                                Text("Chọn tất cả (\(items.count))")
                                    .font(.custom("Georgia", size: 14))
                                    .foregroundColor(.primary)
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                    List {
                        ForEach(items) { item in
                            HStack(spacing: 12) {
                                Button {
                                    if selectedIDs.contains(item.id) {
                                        selectedIDs.remove(item.id)
                                    } else {
                                        selectedIDs.insert(item.id)
                                    }
                                } label: {
                                    Image(systemName: selectedIDs.contains(item.id) ? "checkmark.square.fill" : "square")
                                        .font(.system(size: 20))
                                        .foregroundColor(selectedIDs.contains(item.id) ? Color(red: 1.0, green: 0.45, blue: 0.69) : .gray.opacity(0.5))
                                }
                                .buttonStyle(.plain)

                                Image(item.product.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.product.name)
                                        .font(.custom("Georgia", size: 16))
                                        .lineLimit(1)
                                    
                                    Text("\(Int(item.product.price).formatted()) đ")
                                        .font(.custom("Georgia", size: 15))
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("x\(item.quantity)")
                                    .font(.custom("Georgia", size: 12))
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
                                .font(.custom("Georgia", size: 16))
                            Spacer()
                            Text("\(Int(totalPrice).formatted()) đ")
                                .font(.custom("Georgia-Bold", size: 20))
                                .foregroundStyle(Color(red: 1.0, green: 0.45, blue: 0.69))
                        }
                        
                        Button(action: {
                            let checkoutItems = items.filter { selectedIDs.contains($0.id) }
                            
                            createNewOrder(from: checkoutItems)
                            
                            items.removeAll { selectedIDs.contains($0.id) }
                            selectedIDs.removeAll()
                            
                            showAlert = true
                        }) {
                            Text("Mua (\(selectedIDs.count))")
                                .font(.custom("Georgia", size: 18))
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedIDs.isEmpty ? Color.gray.opacity(0.4) : Color(red: 1.0, green: 0.45, blue: 0.69))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .disabled(selectedIDs.isEmpty)
                    }
                    .padding()
                    .background(Color.pink.opacity(0.03))
                }
            }
            .navigationTitle("Giỏ hàng")
            .alert("Đặt hàng thành công!", isPresented: $showAlert) {
                Button("Đã hiểu", role: .cancel) { }
            } message: {
                Text("Chờ")
            }
        }
    }
}

#Preview {
    CartView()
}
