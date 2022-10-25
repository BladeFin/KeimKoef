//
//  CategoryItem.swift
//  WIP
//
//  Created by admin on 9/7/22.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            let width = UIScreen.main.bounds.size.width
            landmark.image
                .resizable()
                .frame(width: width/2-width/14, height: width/2-width/14)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16, style: .circular)
                )
            
            Text(landmark.headline)
                .foregroundColor(Color.black)
                .frame(maxWidth: 200)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
