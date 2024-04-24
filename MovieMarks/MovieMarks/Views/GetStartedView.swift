//
//  GetStarted.swift
//  MovieMarks
//
//  Created by Marc Bieber on 06/03/2024.
//

import SwiftUI

struct GetStartedView: View {
    @Binding var user: [User]
    @EnvironmentObject var viewRouter: ViewRouter
    let saveAction: ()->Void

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor1")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    GeometryReader { geometry in
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: LogoConstants.logoWidth, height: LogoConstants.logoHeight)
                            .offset(y: 32 - geometry.safeAreaInsets.top)
                    }
                    Spacer()
                    
                    VStack {
                        Text("Your ") +
                        Text("Ultimate")
                            .foregroundColor(Color("main"))
                        + Text(" Movies\nwatching companion app.")
                        
                    }
                    .padding()
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    
                    Spacer()
                    
                    Text("Easily rate movies on a scale from 1 to 5 stars and jot down your thoughts with personalized reviews.")
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {}) {
                        NavigationLink(destination: RegisterView(user: $user, saveAction: saveAction).environmentObject(viewRouter)){
                            Text("Get started")
                                .foregroundColor(Color("ButtonForground"))
                                .frame(maxWidth: .infinity, minHeight: 48)
                                .background(Color("main"))
                                .cornerRadius(5)
                        }
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        NavigationLink(destination: LoginView(user: $user, saveAction: saveAction).environmentObject(viewRouter)){
                            Text("Login")
                                .foregroundColor(Color("TextColor"))
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    GetStartedView()
//}

struct GetStartedView_Previews: PreviewProvider {
    
    @State static var user: [User] = User.sampleData
    
    static var previews: some View {
        GetStartedView(user: $user, saveAction: {})
    }
}
