//
//  CateView.swift
//  Week3
//
//  Created by MAY 03 on 9/10/26.
//Nam Phuong

import SwiftUI

struct CateView: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 16){
                    Text("Danh mục sản phẩm")
                        .font(.custom("Georgia-Bold", size: 22))
                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                        .padding(.horizontal)
                        .padding(.top, 8)
                    LazyVGrid(columns: columns, spacing: 16){
                        ForEach(cate){ i in
                            NavigationLink(destination: CateDetailView(category: i)){
                                VStack{
                                    Image(i.iconName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                    Text(i.name)
                                        .font(.custom("Georgia", size: 20))
                                        .foregroundColor(Color(red: 1.0, green: 0.45, blue: 0.69))
                                }
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.03), radius: 5, x: 0, y: 2)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CateView()
}
