//
//  GetStarted.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                GeometryReader { geometry in
                    VStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: LogoConstants.logoWidth, height: LogoConstants.logoHeight)
                            .offset(y: 32 - geometry.safeAreaInsets.top)
                    }
                }
                Spacer()
                
                VStack {
                    Text("Your ") +
                    Text("Ultimate")
                        .foregroundColor(Color.green)
                    + Text(" Movies\nwatching companion app.")
                        
                }
                .padding()
                .multilineTextAlignment(.center)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 24, weight: .bold, design: .default))
                
                Spacer()
                
                Text("Easily rate movies on a scale from 1 to 5 stars and jot down your thoughts with personalized reviews.")
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Get started")
                        .foregroundColor(Color("forground"))
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color("main"))
                        .cornerRadius(5)
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Login")
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    GetStartedView()
}
