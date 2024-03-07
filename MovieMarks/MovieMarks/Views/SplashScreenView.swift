//
//  SplashScreenView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var logoPosition = 0.0
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            Image("Logo")
                .resizable()
                .scaledToFit()
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        logoPosition -= 100
                    }
                }
                .offset(y: logoPosition)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    viewRouter.currentPage = .getStarted
                }
            }
        }
    }
}

