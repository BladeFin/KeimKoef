//
//  ProfileEditor.swift
//  WIP
//
//  Created by admin on 9/9/22.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    @State private var showingImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        profile.image = Image(uiImage: inputImage)
    }

    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {

        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            HStack {
                Text("Profile Picture").bold()
                Divider()
                //Button("Upload Photo", action: {
                    //profile.image = Image("IMG_0332")
                    //showingImagePicker = true
                //})
                Text("Upload Photo")
                    .onTapGesture(count: 1) {
                        showingImagePicker = true
                        //profile.image = Image("IMG_0332")
                    }
                    .onChange(of: inputImage) {_ in loadImage() }
                    .sheet(isPresented: $showingImagePicker) {
                        ImagePicker(image: $inputImage)
                    }

            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            .onChange(of: profile.prefersNotifications) {_ in
                if (profile.prefersNotifications) {
                    gimmeTheNot(8,00)
                }
            }
        }
        //DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
            //Text("Goal Date").bold()
        //}
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
