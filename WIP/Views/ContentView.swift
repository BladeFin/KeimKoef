//
//  ContentView.swift
//  WIP
//
//  Created by admin on 8/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Category", systemImage: "list.bullet")
                }
                .tag(Tab.featured)
            BadnessHome()
                .tabItem {
                    Label("Badness", systemImage: "hand.thumbsdown.fill")
                }
            RandomHome()
                .tabItem{
                    Label("Random", systemImage: "questionmark.circle")
                }
                .tag(Tab.list)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
