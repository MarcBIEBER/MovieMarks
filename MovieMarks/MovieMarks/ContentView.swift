//
//  ContentView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        switch viewRouter.currentPage {
        case .splashScreen:
            SplashScreenView()
        case .getStarted:
            GetStartedView()
        }
    }
}

#Preview {
    ContentView()
}
