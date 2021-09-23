//
//  ContentView.swift
//  GameCard
//
//  Created by wayne on 2021/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
//            Text(verbatim:"Platform")
//                            .font(.largeTitle)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.primary)
//            Image("Cover")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//            Image("steam")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            ZStack {
                TabView {
                            Text("Game View")
                                .padding()
                                .tabItem {
                                    Image(systemName: "gamecontroller.fill")
                                    Text("Consoles")
                                }
                                .tag(1)
                            Text("Liked View")
                                .padding()
                                .tabItem {
                                    Image(systemName: "bookmark.fill")
                                    Text("Save")
                                }
                                .tag(2)
                            Text("Game Play Status View")
                                .padding()
                                .tabItem {
                                    Image(systemName: "dpad.fill")
                                    Text("Status")
                                }
                                .tag(3)
                            Text("Search View")
                                .padding()
                                .tabItem {
                                    Image(systemName: "magnifyingglass")
                                    Text("Search")
                                }
                                .tag(4)
                            Text("Setting View")
                                .padding()
                                .tabItem {
                                    Image(systemName: "person.fill")
                                    Text("Profile")
                                }
                                .tag(5)
                        }
                HStack {
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
