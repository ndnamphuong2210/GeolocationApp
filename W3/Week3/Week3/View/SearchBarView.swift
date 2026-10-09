//
//  SearchBarView.swift
//  Week3
//
//  Created by MAY 03 on 5/10/26.
//Ngoc Mai

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                
                TextField("", text: $searchText, prompt: Text("Tìm cá, cây thủy sinh, phụ kiện...").foregroundColor(.black.opacity(0.6)))
                    .font(.custom("Georgia", size: 13))
                    .foregroundColor(.black)
                    .accentColor(.black)
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(10)
            .background(Color.pink.opacity(0.05))
            .cornerRadius(10)

            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.pink.opacity(0.05))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
