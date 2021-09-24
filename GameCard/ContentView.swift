//
//  ContentView.swift
//  GameCard
//
//  Created by wayne on 2021/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            TabView {
                ConsolesView()
                    .padding()
                    .tabItem {
                        Image(systemName: "gamecontroller.fill")
                        Text("Consoles")
                    }
                    .tag(1)
                StatsView()
                    .padding()
                    .tabItem {
                        Image(systemName: "dpad.fill")
                        Text("Stats")
                    }
                    .tag(3)
                Text("Setting View")
                    .padding()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
