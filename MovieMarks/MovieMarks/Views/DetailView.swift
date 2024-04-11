//
//  DetailView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var film: Film
    @State private var editingScrum = Film.emptyFilm
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        Spacer()
        // TODO: Faire un jolie composant avec l'image et les reviews et le genre du film comme sur figma
        AsyncImage(url: URL(string: film.imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        Spacer()
        NavigationLink(destination: ReviewView(film: $film)) {
            // TODO: Crée un jolie composant pour acceder au review
            Text("Review")
        }
        Text("Synopsis")
            .foregroundColor(Color("main"))
        Text(film.synopsis)
        Spacer()
            .navigationTitle(film.title)
    }
}
