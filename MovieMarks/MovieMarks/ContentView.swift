//
//  ContentView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @StateObject private var store = FilmStore()
    @State var sampleData = Film.sampleData

    var body: some View {
        switch viewRouter.currentPage {
        case .splashScreen:
            SplashScreenView()
                .environmentObject(viewRouter)
        case .getStarted:
            GetStartedView()
                .environmentObject(viewRouter)
        case .mainView:
//            MainView()
//                .environmentObject(viewRouter)
//            MainView(film: $store.film) {
            MainView(film: $sampleData) {
                Task {
                    do {
                        try await store.save(film: store.film)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .environmentObject(viewRouter)
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
