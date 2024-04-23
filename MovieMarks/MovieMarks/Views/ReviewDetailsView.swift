//
//  ReviewDetails.swift
//  MovieMarks
//
//  Created by Marc Bieber on 14/04/2024.
//

import SwiftUI
import Foundation

struct ReviewDetailsView: View {
    @Binding var review: Film.Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(review.name)
                Spacer()
                Text(review.dateStr)
            }
            StarRatingView(rating: Double(review.rate), size: 12)
                .padding([.top, .bottom], 2)
            Text(review.comment)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        Divider()
    }
}

