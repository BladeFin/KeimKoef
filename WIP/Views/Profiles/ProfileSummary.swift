//
//  ProfileSummary.swift
//  WIP
//
//  Created by admin on 9/7/22.
//

import SwiftUI
import UserNotifications

func gimmeTheNot(_ hour: Int, _ minute: Int) {
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = "Title"
    notificationContent.body = "Testerwahoo"
    notificationContent.badge = NSNumber(value: 1)
    notificationContent.sound = .default

    var datComp = DateComponents()
    datComp.hour = hour
    datComp.minute = minute
    let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
    let request = UNNotificationRequest(identifier: "ID", content: notificationContent, trigger: trigger)
    UNUserNotificationCenter.current().add(request) { (error : Error?) in
        if let theError = error {
            print(theError.localizedDescription)
        }
    }
}
/**
import UserNotifications

func setUpLocalNotification(hour: Int, minute: Int) {
    let calendar = NSCalendar(indentifier: .gregorian)!
    
    var dateFire = Date()
    
    var fireComponents = calendar.components( [NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from:dateFire)
    
    if (fireComponents.hour! > hour || (fireComponents.hour == hour && fireComponents.minute! >= minute) ) {
        dateFire = dateFire.addingTimeInterval(86400)
        fireComponents = calendar.components( [NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from:dateFire)
    }
    
    fireComponents.hour = hour
    fireComponents.minute = minute
    
    dateFire = calendar.date(from: fireComponents)!
    
    let localNotification = UILocalNotification()
    localNotification.fireDate = dateFire
    localNotification.alertBody = "Record today Numerily.  Be completely Honest: Saw, dud?"
    localNotification.repeatInterval = NSCalendar.Unit.day
    localNotification.soundName = UILocalNotificationDefaultSoundName
    
    UIApplication.shared.scheduleLocalNotification(localNotification)
}
*/
struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    profile.image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 1)
                        }
                        .shadow(radius: 2)
                        .frame(width: 50, height: 50)
                        .edgesIgnoringSafeArea(.leading)
                    Text(profile.username)
                        .bold()
                        .font(.title)
                        
                }
                
                Text("Notifications: \(profile.prefersNotifications ? "On":"Off" )")
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
