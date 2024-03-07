//
//  MovieMarksApp.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

@main
struct MovieMarksApp: App {
    @StateObject var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
        }
    }
}
