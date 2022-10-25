//
//  WIPApp.swift
//  WIP
//
//  Created by admin on 8/18/22.
//

import SwiftUI

@main
struct WIPApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
