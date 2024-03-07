//
//  SplashScreenView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct SplashScreenView: View {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                switchToGetStarted()
            }
        }
    }
    
    func switchToGetStarted() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate,
                   let window = sceneDelegate.window {
                    window.rootViewController = UIHostingController(rootView: GetStarted())
                }
    }
}

#Preview {
    SplashScreenView()
}
