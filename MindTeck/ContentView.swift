//
//  ContentView.swift
//  MindTeck
//
//  Created by Rahul Bashetty on 09/08/24.
//

import SwiftUI

struct ContentView: View {
    let images = ["maharashtraIcon", "karnataka", "andhraPradesh"]
    @State private var selectedIndex = 0
    @State private var searchText = ""
    
    let listItemsDictionary = [
        0: ["Pune", "Mumbai", "Nagpur"],
        1: ["Bangalore", "Mysore", "Hubli"],
        2: ["Hyderabad", "Vijayawada", "Visakhapatnam"]
    ]
    
    let imageItemsDictionary = [
        0: ["puneCityIcon", "mumbaiCityIcon", "nagpurCityIcon"],
        1: ["bangaloreCityIcon", "mysoreCityIcon", "hubliCityIcon"],
        2: ["hyderabadCityIcon", "vijayawadaCityIcon", "vizagCityIcon"]
    ]
    
    var filteredListItems: [(String, String)] {
        let currentListItems = listItemsDictionary[selectedIndex] ?? []
        let currentImageItems = imageItemsDictionary[selectedIndex] ?? []
        let combinedItems = Array(zip(currentListItems, currentImageItems))
        if searchText.isEmpty {
            return combinedItems
        } else {
            return combinedItems.filter { $0.0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ImageCarouselView(images: images, selectedIndex: $selectedIndex)
                    .frame(height: 300)
                
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                LazyVStack {
                    ForEach(filteredListItems, id: \.0) { labelName, imageName in
                        HStack {
                            Image(imageName)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(.trailing, 10)
                            Text(labelName)
                                .font(.headline)
                            Spacer()
                        }
                        .padding()
                        Divider()
                    }
                }
                .padding(.top)
            }
        }.padding([.bottom, .top], 1)
    }
}

struct ImageCarouselView: View {
    let images: [String]
    @Binding var selectedIndex: Int
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(images.indices, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}


#Preview {
    ContentView()
}
