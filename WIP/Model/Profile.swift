//
//  Profile.swift
//  WIP
//
//  Created by admin on 9/7/22.
//

import Foundation
import SwiftUI

struct Profile {
    var username: String
    var prefersNotifications = true
    var birthday = Date()
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    private var imageName: String
    var image: Image
    
    static let `default` = Profile(username: "g_kumar", imageName: "Picture", image: Image("Picture"))
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }


}
