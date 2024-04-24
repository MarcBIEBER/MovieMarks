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
                sendNotification(rating: Int(rating), reviewText: reviewText)
                
            }
            .padding()
            .background(Color("main"))
            .foregroundColor(Color("TextColor"))
            .cornerRadius(10)
        }
        .padding()
        Spacer()
    }
    
    func sendNotification(rating: Int, reviewText: String) {
        let content = UNMutableNotificationContent()
        content.title = "New Review Submitted"
        content.body = "Rating: \(rating) stars\nReview: \(reviewText)"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Erreur lors de l'ajout de la notification: \(error)")
            }
            print(error as Any)
        }
    }
}
//
//#Preview {
//    AddReviewView()
//}
