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
        HStack() {
            // TODO: Afficher l'image (regarder dans le fichier detailView)
            Text(film.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Text(String(film.rating))
                .font(.caption2)
                .accessibilityAddTraits(.isHeader)
        }
        .padding()
        .cornerRadius(12)
    }
}
