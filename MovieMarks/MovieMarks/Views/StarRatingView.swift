//
//  StarRating.swift
//  MovieMarks
//
//  Created by Marc Bieber on 11/04/2024.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    var maximumRating: Int
    var onColor: Color
    var offColor: Color
    var fullStarImage: String
    var halfStarImage: String
    var emptyStarImage: String
    var size: CGFloat

    init(rating: Double, maximumRating: Int = 5,
         onColor: Color = Color("main"), offColor: Color = Color("main"),
         fullStarImage: String = "star.fill", halfStarImage: String = "star.leadinghalf.filled",
         emptyStarImage: String = "star", size: CGFloat = 20) {
        self.rating = rating
        self.maximumRating = maximumRating
        self.onColor = onColor
        self.offColor = offColor
        self.fullStarImage = fullStarImage
        self.halfStarImage = halfStarImage
        self.emptyStarImage = emptyStarImage
        self.size = size
    }
    
    private func starType(for position: Int) -> String {
            let currentRating = Double(position)
            if rating >= currentRating {
                return fullStarImage
            } else if rating > currentRating - 1 && rating < currentRating {
                return halfStarImage
            } else {
                return emptyStarImage
            }
        }
    
    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                Image(systemName: starType(for: number))
                    .foregroundColor(rating >= Double(number) ? onColor : offColor)
                    .font(.system(size: size))
            }
        }
    }
}
