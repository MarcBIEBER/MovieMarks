//
//  MainView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import SwiftUI

struct MainView: View {
    @Binding var films: [Film]
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var showprofil = false
    @State private var selectedFilmIndex: Int? = nil
    @State private var selectedFilm: Film? = nil
    var body: some View {
        VStack {
            headerView
            GeometryReader { geometry in
                ScrollView {
                    ForEach(films.indices, id: \.self) { index in
                        CardView(film: films[index])
                            .background(Color("BackgroundColor1"))
                            .cornerRadius(12)
                            .padding()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                            .shadow(radius: 1)
                            .onTapGesture {
                                selectedFilm = films[index]
                            }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(item: $selectedFilm, onDismiss: {
                    selectedFilm = nil
                }) { film in
                    DetailView(film: $films[films.firstIndex(where: { $0.id == film.id })!])
                }
                .sheet(isPresented: $showprofil, content: {
                        ProfilView()
                })
    }
}

private extension MainView {
    // Vue pour le header
    var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Home")
                    .foregroundColor(Color("main"))
                    .font(.system(size: 24, weight: .bold))
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
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Image(systemName: "person.fill")
                .onTapGesture{
                    showprofil = true
                }

        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("BackgroundColor1"))
        .shadow(radius: 1)
    }
}

struct MainView_Previews: PreviewProvider {
    
    @State static var films: [Film] = Film.sampleData
    
    static var previews: some View {
        MainView(films: $films)
    }
}

