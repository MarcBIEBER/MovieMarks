//
//  ProfilView.swift
//  MovieMarks
//
//  Created by gabrielle walgraef on 13/04/2024.
//

import SwiftUI

struct ProfilView: View {
    @EnvironmentObject var themeSettings: ThemeSettings
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Define isDarkMode directly
    @State private var selectedLanguageIndex = 0
    let languages = ["English", "French"]
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                    .onChange(of: isDarkMode) { newValue in
                        themeSettings.updateAppTheme()
                        isDarkMode = newValue
                    }
                }
        
                Section(header: Text("Language")) {
                    Picker(selection: $selectedLanguageIndex, label: Text("Language")) {
                        ForEach(0..<languages.count) { index in
                            Text(self.languages[index])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button(action: {
                        // Perform logout action here
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
            .preferredColorScheme(isDarkMode ? .dark : .light) // Set preferred color scheme based on isDarkMode
        }
        .onAppear {
        }
    }
}

#Preview {
    ProfilView()
}
