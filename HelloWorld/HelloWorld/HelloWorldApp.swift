//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by jeongguk on 11/28/23.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    var body: some Scene {
        WindowGroup {
            Home()
                .environmentObject(Store())
        }
    }
}
