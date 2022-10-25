//
//  Occurence.swift
//  WIP
//
//  Created by admin on 10/17/22.
//


import Foundation
import SwiftUI

struct Occurence: Hashable, Codable, Identifiable {
    var data: String
    var source: String
    var solution: String
    var badness: Int //1-10
    var id: Int
    var headline: String
   // var categories = ["Environment", "Organisms", "Political Affairs","Other","Crime","Economics","Health"]
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case environment = "Environment"
        case organisms  = "Organisms"
        case political = "Political Affairs"
        case other = "Other"
        case crime = "Crime"
        case economics = "Economics"
        case health = "Health"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
