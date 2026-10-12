//
//  ProductCardView.swift
//  Week3
//Ngọc Mai

import SwiftUI

struct ProductCardView: View {
    var searchText: String = ""
    @State private var showAlert = false
    @State private var selectedProductName = ""

    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { product in
                product.name.localizedCaseInsensitiveContains(searchText) ||
                product.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if filteredProducts.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 30))
                        .foregroundColor(.gray.opacity(0.5))
                    Text("Không tìm thấy sản phẩm phù hợp")
                        .font(.custom("Georgia", size: 13))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
            } else {
                // CUỘN NGANG TẠI ĐÂY
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(filteredProducts) { item in
                            VStack(alignment: .leading, spacing: 0) {
                                // Hình ảnh & Nút thả tim
                                ZStack(alignment: .topTrailing) {
                                    Image(item.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 90)
                                        .frame(width: 130)
                                        .background(Color.pink.opacity(0.04))

                                    Button(action: {}) {
                                        Image(systemName: "heart")
                                            .font(.system(size: 10))
                                            .padding(5)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                            .foregroundColor(.gray)
                                    }
                                    .padding(6)
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(item.name)
                                        .font(.custom("Georgia", size: 12))
                                        .lineLimit(1)
                                        .foregroundColor(.primary)

                                    Text("\(Int(item.price).formatted()) đ")
                                        .font(.custom("Georgia-Bold", size: 13))
                                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))

                                    Button(action: {
                                        add(product: item)
                                        selectedProductName = item.name
                                        showAlert = true
                                    }) {
                                        HStack(spacing: 4) {
                                            Image(systemName: "cart.badge.plus")
                                                .font(.system(size: 10))
                                            Text("Thêm vào giỏ")
                                                .font(.custom("Georgia-Bold", size: 11))
                                        }
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 6)
                                        .background(Color(red: 1.0, green: 0.45, blue: 0.69))
                                        .cornerRadius(8)
                                    }
                                    .padding(.top, 4)
                                }
                                .padding(8)
                            }
                            .frame(width: 146)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                }
            }
        }
        .alert("Thành công!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Đã thêm \"\(selectedProductName)\" vào giỏ hàng.")
        }
    }
}

#Preview {
    ProductCardView()
}
