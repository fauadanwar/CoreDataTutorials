//
//  HelloCoreDataApp.swift
//  HelloCoreData
//
//  Created by Fauad Anwar on 07/03/23.
//

import SwiftUI

@main
struct HelloCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
