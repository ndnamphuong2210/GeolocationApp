//
//  CateDetailView.swift
//  Week3
//Nam Phuong

import SwiftUI

struct CateDetailView: View {
    let category: ProductCategory
    @State private var showAlert = false
    @State private var selectedProductName = ""

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var filteredProducts: [Product] {
        products.filter { $0.categoryID == category.id }
    }

    var body: some View {
        ZStack {
            Color.pink.opacity(0.025)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    Text(category.name)
                        .font(.custom("Georgia", size: 20))
                        .bold()
                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                        .padding(.top)

                    if filteredProducts.isEmpty {
                        VStack(spacing: 8) {
                            Image(systemName: "tray")
                                .font(.system(size: 35))
                                .foregroundColor(.gray.opacity(0.5))
                            Text("Chưa có sản phẩm nào")
                                .font(.custom("Georgia", size: 14))
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 40)
                    } else {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredProducts) { item in
                                VStack(alignment: .leading, spacing: 8) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color.pink.opacity(0.05))
                                            .frame(height: 120)

                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 90)
                                    }

                                    Text(item.name)
                                        .font(.custom("Georgia", size: 14))
                                        .foregroundColor(.primary)
                                        .lineLimit(1)

                                    Text(item.description)
                                        .font(.custom("Georgia", size: 11))
                                        .foregroundColor(.gray)
                                        .lineLimit(2)

                                    Text("\(Int(item.price).formatted()) đ")
                                        .font(.custom("Georgia-Bold", size: 14))
                                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))

                                    Button(action: {
                                        add(product: item)
                                        selectedProductName = item.name
                                        showAlert = true
                                    }) {
                                        HStack(spacing: 4) {
                                            Image(systemName: "cart.badge.plus")
                                                .font(.system(size: 12))
                                            Text("Add")
                                                .font(.custom("Georgia-Bold", size: 12))
                                        }
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(Color(red: 1.0, green: 0.45, blue: 0.69))
                                        .cornerRadius(10)
                                    }
                                    .padding(.top, 4)
                                }
                                .padding(12)
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.03), radius: 5, x: 0, y: 2)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .alert("", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("\"\(selectedProductName)\" added")
        }
    }
}

#Preview {
    NavigationStack {
        CateDetailView(category: cate[0])
    }
}
