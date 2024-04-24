//
//  ContentView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeSettings: ThemeSettings
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var store = FilmStore()
    @StateObject private var userStore = UserStore()
    @State var sampleData = Film.sampleData
    @State var sampleUser = User.sampleData

    var body: some View {
        switch viewRouter.currentPage {
        case .splashScreen:
            SplashScreenView(user: $userStore.user)
                .environmentObject(viewRouter)
                .task {
                    do {
                        try await userStore.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        case .getStarted:
            GetStartedView(user: $userStore.user) {
                Task {
                    do {
                        try await userStore.save(user: userStore.user)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .environmentObject(viewRouter)
                .task {
                    do {
                        try await userStore.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        case .mainView:
            MainView(user: $userStore.user, films: $sampleData) {
                Task {
                    do {
                        try await userStore.save(user: userStore.user)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .environmentObject(viewRouter)
                .task {
                    do {
                        try await userStore.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
