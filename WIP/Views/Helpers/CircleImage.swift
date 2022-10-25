//
//  CircleImage.swift
//  WIP
//
//  Created by admin on 8/23/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        if #available(iOS 15.0, *) {
            image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        } else {
            Image("turtlerock")
                .resizable(resizingMode: .stretch)
                .scaledToFit()
                .clipShape(Circle())
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
