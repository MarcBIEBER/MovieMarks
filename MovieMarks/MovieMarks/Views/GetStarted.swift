//
//  GetStarted.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct GetStarted: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
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
                
                Text("Easily rate movies on a scale from 1 to 5 stars and jot down your thoughts with personalized reviews.")
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding()
                Button(label: "Get started") {
                    
                }
                    
            }
        }
    }
}

#Preview {
    GetStarted()
}
