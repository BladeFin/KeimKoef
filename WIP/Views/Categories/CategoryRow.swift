//
//  CategoryRow.swift
//  WIP
//
//  Created by admin on 9/7/22.
//

import SwiftUI

func getColor(_ num: Int) -> Color {
    if (num < 0) {
        return Color.black
    } else if (num < 4) {
        return Color.green
    } else if (num < 7) {
        return Color.yellow
    } else if (num < 9) {
        return Color.orange
    } else {
        return Color.red
    }
}

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) { //1-3,4-6,78,910
            //var col = Color.black
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
                .foregroundColor(getColor(Int(categoryName) ?? -1))
            

                
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height:185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
