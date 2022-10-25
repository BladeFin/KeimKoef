//
//  LandmarkDetail.swift
//  WIP
//
//  Created by admin on 8/30/22.
//

import SwiftUI

func makeProperURL(_ str: String) -> String {
    if (String(str.prefix(7)) != "http://" && String(str.prefix(8)) != "https://") {
        return "https://" + str
    } else {
        return str
    }
}

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showSafari: Bool = false
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    
    var body: some View {
        
//        VStack(spacing: 0) {
//            Header()
        NavigationView{

            ScrollView{
                landmark.image
                    .resizable()
                    .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight/3)
                //Text(String(Int(UIScreen    .screenHeight)))
                //Text(String(Int(UIScreen    .screenWidth)))
                if (landmark.badness < 4) {
                    Text("Level " + String(landmark.badness))
                        .foregroundColor(Color.green)
                } else if (landmark.badness < 7) {
                    Text("Level " + String(landmark.badness))
                        .foregroundColor(Color.yellow)
                } else if (landmark.badness < 9) {
                    Text("Level " + String(landmark.badness))
                        .foregroundColor(Color.orange)
                } else {
                    Text("Level " + String(landmark.badness))
                        .foregroundColor(Color.red)
                }
                Text("The Problem:")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .foregroundColor(Color.red)
                Text(landmark.data)
                    .font(.title3)
                    .padding(.horizontal)
                Text("What do we do?")
                    .foregroundColor(Color.green)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text(landmark.solution)
                    .font(.title3)
                    .padding(.horizontal)
                Divider()
                //Link("Source2", destination: URL(string: "https://google.com")!)
                Text("Source")
                    .foregroundColor(Color.blue)
                    .padding(.bottom)
                    .onTapGesture {
                        showSafari.toggle()
                    }
                    .fullScreenCover(isPresented: $showSafari, content: {
                        SFSafariViewWrapper(url: URL(string: makeProperURL(landmark.source))!)
                    })
                   // .padding()
            }

            .navigationTitle(String(landmark.category.rawValue))
            .navigationBarTitleDisplayMode(.inline)
        }

//        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
