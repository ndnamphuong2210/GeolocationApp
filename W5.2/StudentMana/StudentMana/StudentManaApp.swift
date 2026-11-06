//
//  StudentManaApp.swift
//  StudentMana
//
//  Created by MAY 03 on 6/11/26.
//

import SwiftUI

import SwiftUI

@main
struct StudentManaApp: App {
    @StateObject private var controller = Controller()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(controller)
        }
    }
}
