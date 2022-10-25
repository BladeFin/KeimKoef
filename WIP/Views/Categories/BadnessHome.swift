//
//  BadnessHome.swift
//  WIP
//
//  Created by admin on 10/24/22.
//

import SwiftUI

struct BadnessHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
                List {
                    ForEach(modelData.badness.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: String(key), items: modelData.badness[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.inset)
                .navigationTitle("Sorted by Badness")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
            
        }
    }
}

struct BadnessHome_Previews: PreviewProvider {
    static var previews: some View {
        BadnessHome()
            .environmentObject(ModelData())
    }
}
