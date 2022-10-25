//
//  RandomHome.swift
//  WIP
//
//  Created by admin on 10/24/22.
//

import SwiftUI

func nextNum(_ curr: Int, _ size: Int) -> Int {
    var nextNum = Int.random(in:0..<size)
    while (nextNum == curr) {
        nextNum = Int.random(in:0..<size)
    }
    return nextNum
}

struct RandomHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State var aCoolNumber = 1
    @State private var currentNum = 0
    var landmarks: [Landmark] {
        return modelData.landmarks
    }
    var body: some View {
        NavigationView {
            VStack {
                LandmarkDetail(landmark: landmarks[Int.random(in:0..<landmarks.count)])
                Text(String(aCoolNumber))
            }
            .navigationTitle("Tap to Progress")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .onTapGesture(count:1) {
            currentNum = nextNum(currentNum, landmarks.count)
            aCoolNumber+=1
        }
        
        //.navigationBarTitleDisplayMode( .inline)
        //NavigationView {
            //NavigationLink(destination: RandomHome()) {
                //LandmarkDetail(landmark: landmarks[Int.random(in:0..<landmarks.count)])
                //.onTapGesture(perform:)
            //}
            
        //}
    }
}

struct RandomHome_Previews: PreviewProvider {
    static var previews: some View {
        RandomHome()
            .environmentObject(ModelData())
    }
}
