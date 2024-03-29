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
            GeometryReader { geometry in
                VStack {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: LogoConstants.logoWidth, height: LogoConstants.logoHeight)
                        .offset(y: logoPosition)
                        .onAppear {
                            logoPosition = (geometry.size.height / 2) - (LogoConstants.logoHeight / 2) - geometry.safeAreaInsets.top
                            withAnimation(.easeIn(duration: 1.0)) {
                                logoPosition = 32 - geometry.safeAreaInsets.top
                            }
                        }
                }
            }
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

