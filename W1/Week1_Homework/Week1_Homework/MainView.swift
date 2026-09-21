//
//  MainView.swift
//  Week1_Homework
//
//  Created by MAY 03 on 14/9/26.
//

import SwiftUI

struct MainView: View {
    @State private var n = ""
    @State private var res1 = ""
    @State private var res2 = ""
    @State private var res3 = ""
    @State private var res4 = ""
    @State private var a = ""
    @State private var b = ""
    @State private var res5 = ""
    @State private var res6 = ""
    @State private var res7 = ""
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Number Tools")
                    .font(.custom("Georgia", size: 35))
                    .bold()
                    .foregroundStyle(Color.pink)
                Text("Small numbers, big possibilities!")
                    .font(.custom("Georgia", size: 15))
                    .bold()
                ZStack{
                    VStack{
                        Text("Single Number (n)")
                            .font(Font.custom("Georgia", size: 20))
                            .foregroundStyle(Color.white)
                            .bold()
                            .padding(.leading, -160)
                        Text("Enter a number:")
                            .font(Font.custom("Georgia", size: 20))
                            .padding(1)
                            .padding(.leading, -175)
                            .foregroundStyle(Color.white)
                        TextField("Number", text: $n)
                            .padding(0)
                            .font(.custom("Georgia", size: 20))
                            .textFieldStyle(.roundedBorder)
                        HStack{
                            Button("n²") {
                                if let nn = Int(n){
                                    let s = nn*nn
                                    res1 = "\(s)"
                                }
                                else {
                                    res1 = "Please enter sth"
                                }
                            }.buttonStyle(.glass)
                            Button("n³") {
                                if let nn = Int(n){
                                    let s = nn*nn*nn
                                    res2 = "\(s)"
                                }
                                else {
                                    res2 = "Please enter sth"
                                }
                            }.buttonStyle(.glass)
                            Button("n!") {
                                
                                if let nn = Int(n){
                                    if nn<=20 && nn>0{
                                        var ress = 1
                                        for i in 1...nn{
                                            ress=ress*i
                                            res3 = "\(ress)"
                                        }
                                    } else{
                                        res3 = "crash"
                                    }
                                    
                                }
                                else {
                                    res3 = "Please enter sth"
                                }
                            }.buttonStyle(.glass)
                            Button("Prime?") {
                                if let nn = Int(n){
                                    var ress = 0
                                    if nn < 2{
                                        res4 = "No"
                                    }
                                    else {
                                        for i in 1...nn{
                                            if nn%i==0{
                                                ress += 1
                                            }
                                        }
                                        if ress==2{
                                            res4 = "Yes"
                                        }
                                        else{
                                            res4 = "No"
                                        }
                                    }
                                    
                                }
                                else {
                                    res4 = "Please enter sth"
                                }
                            }.buttonStyle(.glass)
                        }
                        
                        
                    }
                    .padding(13)
                    .background(Color.pink, in: RoundedRectangle(cornerRadius: 12))
                    .padding(.leading, -0)
                    .padding(.horizontal)
                }
                VStack  {
                    Text("Result: ")
                        .font(.custom("Georgia", size: 20))
                        .foregroundStyle(Color.white)
                        .padding(.leading, -170)
                        .bold()
                    HStack{
                        Text("n² \n \(res1)")
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(Color.black)
                            .padding(3)
                        Text("n³ \n \(res2)")
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(Color.black)
                            .padding(5)
                        Text("n! \n \(res3)")
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(Color.black)
                        Text("Prime \n \(res4)")
                            .font(Font.custom("Georgia", size: 18))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(13)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(Color.black)
                        
                    }
                }
                .frame(maxHeight: 300)
                .padding(15)
                .background(Color.pink, in: RoundedRectangle(cornerRadius: 12))
                .padding(.top, 10)
                .padding(.leading, -0)
                .padding(.horizontal)
                
                VStack{
                    Text("Two Number (a, b)")
                        .font(Font.custom("Georgia", size: 20))
                        .foregroundStyle(Color.white)
                        .bold()
                        .padding(.leading, -135)
                    HStack{
                        Text("Enter a:")
                            .font(Font.custom("Georgia", size: 20))
                            .padding(.leading, -90)
                            .foregroundStyle(Color.white)
                        Text("Enter b:")
                            .font(Font.custom("Georgia", size: 20))
                            .padding(.leading, 70)
                            .foregroundStyle(Color.white)
                    }
                    HStack{
                        TextField("Enter a", text: $a)
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                        TextField("Enter b", text: $b)
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                    }
                    HStack{
                        Button("UCLN (GCD)") {
                            if let x = Int(a), let y = Int(b) {
                                 if x == 0 || y == 0 {
                                    res5 = "\(max(abs(x), abs(y)))"
                                } else {
                                    var aT = abs(x)
                                    var bT = abs(y)
                                    while bT != 0 {
                                        let t = bT
                                        bT = aT % bT
                                        aT = t
                                    }
                                    res5 = "\(aT)"
                                }
                            } else {
                                res5 = "Please enter sth"
                            }
                        }
                        .buttonStyle(.glass)
                        
                        Button("BCNN (LCM)") {
                            if let x = Int(a), let y = Int(b) {
                                if x == 0 || y == 0 {
                                    res6 = "0"
                                } else {
                                    var aT = abs(x)
                                    var bT = abs(y)
                                    while bT != 0 {
                                        let temp = bT
                                        bT = aT % bT
                                        aT = temp
                                    }
                                    let gcd = aT
                                    let lcm = abs(x * y) / gcd
                                    res6 = "\(lcm)"
                                }
                            } else {
                                res6 = "Please enter sth"
                            }
                        }
                        .buttonStyle(.glass)
                    }
                }
                .padding(13)
                .background(Color.blue, in: RoundedRectangle(cornerRadius: 12))
                .padding(.top, 10)
                .padding(.leading, -0)
                .padding(.horizontal)
                
                VStack  {
                    Text("Results for a = \(a), b = \(b):")
                        .font(.custom("Georgia", size: 20))
                        .foregroundStyle(Color.white)
                        .padding(.leading, -130)
                        .bold()
                    HStack{
                        Text("UCLN (GCD) \n \(res5)")
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(Color.black)
                            .padding(3)
                        Text("BCNN (LCM) \n \(res6)")
                            .font(Font.custom("Georgia", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 8))
                            .foregroundStyle(Color.black)
                            .padding(5)
                        
                    }
                }
                .padding(13)
                .background(Color.blue, in: RoundedRectangle(cornerRadius: 12))
                .padding(.top, 10)
                .padding(.leading, -0)
                .padding(.horizontal)
                HStack{
                    Button("Clear All"){
                        a = ""
                        b = ""
                        n = ""
                        res1 = ""
                        res2 = ""
                        res3 = ""
                        res4 = ""
                        res5 = ""
                        res6 = ""
                        res7 = ""
                        
                    }
                    .font(Font.custom("Georgia", size: 20))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(15)
                    .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(Color.black)
                    .padding()
                        
                    Button("Help"){
                        res7 = "Call Napu"
                    }
                    .font(Font.custom("Georgia", size: 20))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(15)
                    .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(Color.black)
                    .padding()
                        
                }
                Text("\(res7)")
                    .font(Font.custom("Georgia", size: 20))
                    .multilineTextAlignment(.center)
            }
            
        
            
        }
        }
        
}

#Preview {
    MainView()
}
