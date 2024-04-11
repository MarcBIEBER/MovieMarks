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
                GeometryReader { geometry in
                    ScrollView {
                        ForEach($film) { $film in
                            NavigationLink(destination: DetailView(film: $film)) {
                                CardView(film: film)
                                    .background(Color("BackgroundColor1"))
                                    .cornerRadius(12)
                                    .padding()
                                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                                    .shadow(radius: 1)
                            }
                        }
                    }
                    .onChange(of: scenePhase) { phase in
                        if phase == .inactive { saveAction() }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        .shadow(radius: 1)
    }
}

struct MainView_Previews: PreviewProvider {
    
    @State static var films: [Film] = Film.sampleData
    
    static var previews: some View {
        MainView(film: $films, saveAction: {})
    }
}

