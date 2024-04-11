//
//  CardView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

struct CardView: View {
    let film: Film
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(url: URL(string: film.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                }
                .frame(maxWidth: .infinity, alignment: .top)
                VStack(alignment: .leading) {
                    Text(film.title)
                        .foregroundColor(Color("main"))
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                    Text(film.type.joined(separator: " - "))
                        .foregroundColor(Color("TextColor"))
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    StarRatingView(rating: film.rating)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .bottom])
            }
            .frame(maxWidth: .infinity)
            .background(Color("BackgroundColor1"))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    // Création d'une instance StateObject pour passer un Binding à MainView
    @State static var films: Film = Film.sampleData[0]
    
    static var previews: some View {
        // Fournir le Binding et une action de sauvegarde vide
        CardView(film: films)
    }
}

