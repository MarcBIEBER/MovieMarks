//
//  ProfilView.swift
//  MovieMarks
//
//  Created by gabrielle walgraef on 13/04/2024.
//

import SwiftUI

struct ProfilView: View {
    @Binding var user: [User]
    @Environment(\.scenePhase) private var scenePhase
//    @EnvironmentObject var themeSettings: ThemeSettings
    @EnvironmentObject var viewRouter: ViewRouter
//    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Define isDarkMode directly
    @State private var selectedLanguageIndex = 0
    let languages = ["English", "French"]
    let saveAction: ()->Void
    
    var body: some View {
        NavigationView {
            
            Form {
//                Section(header: Text("Appearance")) {
//                    Toggle(isOn: $isDarkMode) {
//                        Text("Dark Mode")
//                    }
//                    .onChange(of: isDarkMode) { newValue in
//                        themeSettings.updateAppTheme()
//                        isDarkMode = newValue
//                    }
//                }
        
                Section {
                    Button("Change App Language in System Settings") {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        if logoutUser() == true {
                            viewRouter.currentPage = .getStarted
                        }
                    }) {
                        Text("Log out")
                            .foregroundColor(Color("ButtonForground"))
                    }
                    .frame(maxWidth: .infinity, minHeight: 48)
                    .background(Color("main"))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                }
            }
            .navigationBarTitle("Profile & Settings")
//            .preferredColorScheme(isDarkMode ? .dark : .light) // Set preferred color scheme based on isDarkMode
        }
        .onAppear {
        }
        .onChange(of: viewRouter.currentPage) {
            saveAction()
        }
    }
}

private extension ProfilView {
    func logoutUser() -> Bool {
        if let index = user.firstIndex(where: { $0.isLogin == true }) {
            print(user[index])
            user[index].logout()
            print(user[index])
            return true
        } else {
            return false
        }
    }
}
//#Preview {
//    ProfilView()
//}
