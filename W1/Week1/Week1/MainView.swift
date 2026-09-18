//
//  MainView.swift
//  Week1
//
//  Created by MAY 03 on 14/9/26.
//

import SwiftUI

struct MainView: View {
    @State private var n = ""
    @State private var res = ""
    
    var body: some View {
        VStack {
            Text("Calculate n²")
                .font(.custom("Georgia", size: 35))
                .bold()
                .foregroundStyle(Color.pink)
            Text("Enter n:")
                .font(.custom("Georgia", size: 25))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 20)
            TextField("Number", text: $n)
                .padding(10)
                .font(.custom("Georgia", size: 20))
                .textFieldStyle(.roundedBorder)
            Button("Calculate n²") {
                if let nn = Int(n){
                    let s = nn*nn
                    res = "\(s)"
                }
                else {
                    res = "Please enter sth"
                }
            }.buttonStyle(.glass)
            Button("Calculate n³") {
                if let nn = Int(n){
                    let s = nn*nn*nn
                    res = "\(s)"
                }
                else {
                    res = "Please enter sth"
                }
            }.buttonStyle(.glass)
            Button("Calculate double n") {
                if let nn = Int(n){
                    let s = nn*2
                    res = "\(s)"
                }
                else {
                    res = "Please enter sth"
                }
            }.buttonStyle(.glass)

            Text("Result: \(res)")
                .font(.custom("Georgia", size: 25))
                .foregroundStyle(Color.pink)
        }
            
            
    }
        
}


#Preview {
    MainView()
}
