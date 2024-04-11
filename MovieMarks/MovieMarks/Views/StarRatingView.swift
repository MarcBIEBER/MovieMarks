//
//  StarRating.swift
//  MovieMarks
//
//  Created by Marc Bieber on 11/04/2024.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    var maximumRating = 5
    var onColor = Color("main")
    var offColor = Color("main")
    var fullStarImage = "star.fill"
    var halfStarImage = "star.leadinghalf.filled"
    var emptyStarImage = "star"
    var size: CGFloat = 20
    
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
