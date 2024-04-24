//
//  AddReviewView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 24/04/2024.
//

import SwiftUI

struct EditableStarRatingView: View {
    @Binding var rating: Double
    var maximumRating: Int = 5
    var onColor: Color = Color("main")
    var offColor: Color = .gray
    var size: CGFloat = 44

    // Helper function to determine star image
    private func starImage(for index: Int) -> String {
        if index <= Int(rating) {
            return "star.fill"
        } else {
            return "star"
        }
    }

    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { number in
                Image(systemName: starImage(for: number))
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(number <= Int(rating) ? onColor : offColor)
                    .frame(width: size, height: size)
                    .onTapGesture {
                        self.rating = Double(number)
                    }
            }
        }
    }
}

struct AddReviewView: View {
    @State private var rating: Double = 1
    @State private var reviewText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Your review:")
                .font(.headline)
            
            EditableStarRatingView(rating: $rating)
            
            TextField("Write something here...", text: $reviewText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 100)
            
            Button("Send") {
                // Handle submission logic here
            }
            .padding()
            .background(Color("main"))
            .foregroundColor(Color("TextColor"))
            .cornerRadius(10)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    AddReviewView()
}
