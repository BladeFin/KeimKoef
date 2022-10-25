//
//  Landmark.swift
//  WIP
//
//  Created by admin on 8/29/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var data: String
    var source: String
    var solution: String
    var badness: Int //1-10
    enum Badness: Int, CaseIterable, Codable {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
    }
    var headline: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case environment = "Environment"
        case organisms  = "Organisms"
        case political = "Political Affairs"
        case other = "Other"
        case crime = "Crime"
        case health = "Health"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
