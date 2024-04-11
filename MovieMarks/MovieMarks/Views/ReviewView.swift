//
//  ReviewView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

struct ReviewView: View {
    @Binding var film: Film
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(String(format: "%.1f", film.rating))
            .font(.body)
    }
}
