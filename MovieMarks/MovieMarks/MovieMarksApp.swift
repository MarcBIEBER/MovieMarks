//
//  MovieMarksApp.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI
import UserNotifications

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    let notificationDelegate = NotificationDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = notificationDelegate
        return true
    }
}

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

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
                .environmentObject(themeSettings)

        }
    }
    init() {
        NotificationManager.shared.requestAuthorization()
    }
    
}

class NotificationManager {
    
    static let shared = NotificationManager()
    
    private init() {}
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                if let error = error {
                    print("Erreur de permission: \(error.localizedDescription)")
                } else if granted {
                    print("Permission accordée")
                } else {
                    print("Permission refusée")
                }
            }
    }
}
