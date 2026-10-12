//
//  CategoryRowView.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//  Ngoc Mai

import SwiftUI

struct CategoryRowView: View {
    var categories: [ProductCategory] = cate

    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(categories) { cat in
                VStack(spacing: 6) {
                    Image(cat.iconName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .background(Color.orange.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(cat.name)
                        .font(.custom("Georgia", size: 12))
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategoryRowView()
}
