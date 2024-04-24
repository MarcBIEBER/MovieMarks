//
//  LoginView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import SwiftUI

struct LoginView: View {
    @Binding var user: [User]
    @EnvironmentObject var viewRouter: ViewRouter
    @Environment(\.scenePhase) private var scenePhase
    @State private var username: String = ""
    @State private var password: String = ""
    let saveAction: ()->Void

    var body: some View {
        VStack(alignment: .center) {
            logoView
            emailTextField
            passwordSecureField
            forgotPasswordButton
            signInButton
                .padding(.bottom, 24)
            spacerView
            orSignUpView
            registerView
                .padding(.bottom, 24)
        }
        .background(Color("BackgroundColor1"))
        .onChange(of: scenePhase) {
            if scenePhase == .inactive { saveAction() }
        }
    }
}

private extension LoginView {
    // Vue pour le logo
    var logoView: some View {
        Image("Logo")
            .resizable()
            .scaleEffect(CGSize(width: 0.8, height: 0.8))
            .scaledToFit()
    }
    
    // Champ de texte pour l'email ou le nom d'utilisateur
    var emailTextField: some View {
        TextField("Email or Username", text: $username)
            .textFieldStyle()
    }
    
    // Vue vide pour l'espacement
    var spacerView: some View {
        Spacer()
    }
    
    // Champ sécurisé pour le mot de passe
    var passwordSecureField: some View {
        SecureField("Password", text: $password)
            .textFieldStyle()
    }
    
    // Bouton pour les utilisateurs ayant oublié leur mot de passe
    var forgotPasswordButton: some View {
        HStack {
            Spacer()
            Button("Forget password ?") { }
            .buttonStyle()
        }
    }
    
    // Bouton de connexion
    var signInButton: some View {
        
//        NavigationLink(destination: MainView()) {
//            Text("Sign In")
//        }
//        .frame(maxWidth: .infinity, minHeight: 48.0)
//        .background(Color("main"))
//        .cornerRadius(12)
//        .padding(.horizontal, 24)
//        .foregroundColor(Color("ButtonForground"))
//        
        Button(action: {
            if loginUser(username: username, password: password) == true {
                viewRouter.currentPage = .mainView
            }
        }) {
            Text("Login")
                .foregroundColor(Color("ButtonForground"))
        }
        .frame(maxWidth: .infinity, minHeight: 48)
        .background(Color("main"))
        .cornerRadius(12)
        .padding(.horizontal, 24)
        
    }
    
    // Vue pour l'inscription
    var orSignUpView: some View {
        HStack {
            Spacer()
            Rectangle().frame(height: 0.4)
            Spacer()
            Text("Or sign up")
            Spacer()
            Rectangle().frame(height: 0.4)
            Spacer()
        }
        .padding(.horizontal, 24)
    }
    
    // Vue pour l'enregistrement des nouveaux utilisateurs
    var registerView: some View {
        HStack {
            Text("Don't have an account?")
            NavigationLink(destination: RegisterView(user: $user, saveAction: saveAction)) {
                Text("Register").foregroundColor(Color("main"))
            }
        }
        .font(.system(size: 12, weight: .medium))
        .padding()
    }
}

// MARK: - Styles

private extension View {
    // Style réutilisable pour les champs de texte
    func textFieldStyle() -> some View {
        self.frame(height: 64)
            .padding(.horizontal)
            .background(Color("TextFieldBG"))
            .cornerRadius(12)
            .foregroundColor(Color("TextFieldFG"))
            .padding(.horizontal, 24)
            
    }
    
    // Style réutilisable pour les boutons
    func buttonStyle() -> some View {
        self.foregroundColor(Color("TextFieldFG"))
            .fontWeight(.ultraLight)
            .padding(24)
            .font(.system(size: 14, weight: .light, design: .rounded))
    }
    
    // Padding réutilisable pour les boutons
    func buttonPadding() -> some View {
        self.frame(maxWidth: .infinity, minHeight: 48)
            .padding(.horizontal, 32)
    }
}

private extension LoginView {
    func loginUser(username: String, password: String) -> Bool {
        print("login user function called !")
        print(username, password)
        if let index = user.firstIndex(where: { $0.username == username && $0.password == password }) {
            user[index].login()
            return true
        } else {
            return false
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        let user = User.sampleData
//        return LoginView(user: .constant(user))
//    }
//}

