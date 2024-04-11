//
//  ContentView.swift
//  PlayerStats
//
//  Created by Daniel Ezekiel on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            Text("Hala Madrid")
                .tabItem {
                    Label(" Great White Shake", systemImage: "briefcase")
                }
            
            Text("Real Madrid")
                .tabItem {
                    Label("Royalty", systemImage: "crown")
                }
        }
        .onAppear{
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
