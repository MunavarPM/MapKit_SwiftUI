//
//  Map_SwiftUIApp.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 28/08/23.
//

import SwiftUI

@main
struct Map_SwiftUIApp: App {
    
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)/// By use's the observable obj we one instance only get the the selectedLocation so use it as an environment than the app get one's selectedLocation and it's was we can use across the app
        }
    }
}
