//
//  MainView.swift
//  Week2A
//
//  Created by MAY 03 on 21/9/26.
//

import SwiftUI

struct MainView: View {
    @State var places: [Location] = [
        Location(name: "School", lat: 10.8703, lon: 106.8028),
        Location(name: "Home", lat: 10.9500, lon: 106.8200),
        Location(name: "Cafe", lat: 10.8752, lon: 106.8012)
    ]
    @State var namee: String = ""
    var filterplaces: [Location] {
        if namee.isEmpty{
            return places
        } else {
            return places.filter{
                $0.name.localizedCaseInsensitiveContains(namee)
            }
        }
    }
    
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack(spacing:2){
                    Image("loc")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Napu's places")
                        .font(.custom("Georgia", size: 35))
                        .foregroundColor(.pink)
                    Text("Save place napu love")
                        .font(.custom("Georgia", size: 20))
                        .foregroundColor(.brown)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.brown)
                        TextField("Search place...", text: $namee)
                            .textFieldStyle(.roundedBorder)
                            
                    }
                    .padding(.horizontal, 30)
                    .padding(15)
                }
                List(filterplaces){place in
                    HStack{
                        icon(for: place.name)
                            .padding(.horizontal, 5)
                        VStack(alignment: .leading){
                           Text(place.name)
                               .font(.headline)
                           Text("\(place.lat), \(place.lon)")
                               .font(.subheadline)
                               .foregroundColor(.secondary)
                       }
                        Image(systemName: "chevron.right")
                            .foregroundColor(.pink)
                            .padding(.leading, 100)
                    }
                     
                }
                NavigationLink(destination: AddPlaceView(onSave: {newPlace in places.append(newPlace)})){
                    HStack{
                        Image(systemName: "plus")
                        Text("Add place nè")
                            .font(Font.custom("Georgia", size: 20))
                    }
                    .frame(maxWidth: .infinity)
                    
                }.padding()
                    .background(Color(red: 0.1, green: 0.9, blue: 0.95))
                    .foregroundStyle(Color.white)
                    .cornerRadius(20)
                    .buttonStyle(.plain)
                    .frame(width: 300)
                Text("Total places: \(places.count)")
                    .font(Font.custom("Georgia", size: 20))
                    .foregroundStyle(Color.pink)
                
                
            }
        }
        
        
    }
}
func icon(for name: String)-> some View{
    switch name {
    case "Home":
        return Image(systemName: "house")
    case "Cafe":
        return Image(systemName: "cup.and.saucer")
    case "School":
        return Image(systemName: "graduationcap")
    default :
        return Image(systemName: "mappin")
    }
    
}

#Preview {
    MainView()
}
