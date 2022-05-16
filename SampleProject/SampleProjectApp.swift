//
//  SampleProjectApp.swift
//  SampleProject
//
//  Created by yusaku maki on 2022/05/16.
//

import SwiftUI
import FirebaseCore

@main
struct SampleProjectApp: App {
    init() {
        setup()
    }

    func setup() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
