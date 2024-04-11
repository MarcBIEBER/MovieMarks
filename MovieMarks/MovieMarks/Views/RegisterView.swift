//
//  RegisterView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    var body: some View {
        ZStack {
            Color("BackgroundColor1")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("Create Account")
                    .foregroundColor(Color("main"))
                    .font(.system(size: 32, weight: .bold))
                    .frame(alignment: .trailing)
                
                Text("Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!")
                    .font(.body)
                    .foregroundColor(Color("TextColor"))
                    .padding(.horizontal, 24)
                
                Spacer()
                
                TextField("Email", text: $email)
                    .frame(height: 64)
                    .padding(.horizontal)
                    .background(Color("TextFieldBG"))
                    .cornerRadius(12)
                    .foregroundColor(Color("TextFieldFG"))
                    .padding(.horizontal, 24)
                
                SecureField("Password", text: $password)
                    .frame(height: 64)
                    .padding(.horizontal)
                    .background(Color("TextFieldBG"))
                    .cornerRadius(12)
                    .foregroundColor(Color("TextFieldFG"))
                    .padding(.horizontal, 24)
                
                SecureField("Confirm Password", text: $passwordConfirm)
                    .frame(height: 64)
                    .padding(.horizontal)
                    .background(Color("TextFieldBG"))
                    .cornerRadius(12)
                    .foregroundColor(Color("TextFieldFG"))
                    .padding(.horizontal, 24)
                
                Button(action: {
                    viewRouter.currentPage = .mainView
                }) {
                    Text("Create Account")
                        .foregroundColor(Color("ButtonForground"))
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .background(Color("main"))
                .cornerRadius(12)
                .padding(.horizontal, 24)
                
                
                Spacer()
                
                // Terms and Privacy Policy
                HStack {
                    Text("By logging in you agree to our ")
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .fontWeight(.ultraLight)
                    + Text("Terms & Conditions ")
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .foregroundColor(Color("TextColor"))
                    
                    + Text("and")
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .fontWeight(.ultraLight)
                    + Text(" Privacy Policy")
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(Color("TextColor"))
                    NavigationLink("Sign in", destination: LoginView())
                        .foregroundColor(Color("main"))
                }
                .padding()
            }
        }
    }
}

//#Preview {
//    RegisterView()
//}
