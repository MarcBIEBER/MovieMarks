//
//  MainView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import SwiftUI

struct MainView: View {
    @Binding var film: [Film]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewFilmView = false
    let saveAction: ()->Void
    var body: some View {
        VStack {
            headerView
            NavigationStack {
                List($film) { $film in
                    NavigationLink(destination: DetailView(film: $film)) {
                        CardView(film: film)
                    }
//                    .background(Color("BackgroundColor1"))
                }
                .navigationTitle("Film")
//                .toolbar {
//                    Button(action: {
//                        isPresentingNewFilmView = true
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                    .accessibilityLabel("New film")
//                }
            }
            .sheet(isPresented: $isPresentingNewFilmView) {
//                NewScrumSheet(film: film, isPresentingNewFilmView: $isPresentingNewFilmView)
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
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
