//
//  MovieMarksApp.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

class ThemeSettings: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = {
        let currentStyle = UIScreen.main.traitCollection.userInterfaceStyle
        return currentStyle == .dark
    }()
    
    func updateAppTheme() {
        let appearance: UIUserInterfaceStyle = isDarkMode ? .dark : .light
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = appearance
    }
}



@main
struct MovieMarksApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var themeSettings = ThemeSettings()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
                .environmentObject(themeSettings)

        }
    }
}
