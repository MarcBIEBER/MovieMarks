//
//  MainView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            headerView
            Spacer()
        }
    }
}

private extension MainView {
    // Vue pour le header
    var headerView: some View {
        VStack {
            HStack {
                Text("Home")
                Spacer()
                Image(systemName: "person.fill")
            }
            Spacer()
            HStack {
                Text("Click to have the films details")
                Spacer()
            }
            Spacer()
            HStack {
                Text("Film")
                    .padding(.horizontal)
                    .background(Color("main"))
                    .cornerRadius(12)
                Text("Series")
                    .padding(.horizontal)
                    .background(Color("TextFieldBG"))
                    .cornerRadius(12)
                Spacer()
            }
        }
        .frame(height: 100)
        .padding()
        .background(Color("BackgroundColor1"))
    }
    
    
}

#Preview {
    MainView()
}
