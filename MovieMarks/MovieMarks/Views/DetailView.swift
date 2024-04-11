//
//  DetailView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var film: Film
    
    var body: some View {
        ScrollView {
            VStack {
                // TODO: Faire un jolie composant avec l'image et les reviews et le genre du film comme sur figma
                AsyncImage(url: URL(string: film.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(12)
                        .padding()
                        .frame(maxHeight: 300)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                
                Divider()
                    .padding()
                NavigationLink(destination: ReviewView(film: $film)) {
                    // TODO: Crée un jolie composant pour acceder au review
                    Text("Review")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Divider()
                    .padding()
                VStack(alignment: .leading) {
                    Text("Synopsis")
                        .foregroundColor(Color("main"))
                    Text(film.synopsis)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Spacer()
                    .navigationTitle(film.title)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    @State static var film = Film.sampleData[0]
    static var previews: some View {
        NavigationView {
            DetailView(film: $film)
        }
    }
}
