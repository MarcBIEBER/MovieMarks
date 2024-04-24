//
//  ReviewView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

struct ReviewView: View {
    @Binding var film: Film
    
    var totalReviews: Int {
        film.ratingTab.reduce(0, +)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ForEach(0..<film.ratingTab.count, id: \.self) { index in
                    HStack {
                        Text("\(film.ratingTab.count - index) stars")
                            .frame(width: 80, alignment: .trailing)
                        Rectangle()
                            .frame(width: CGFloat(film.ratingTab[film.ratingTab.count - index - 1]) / CGFloat(film.ratingTab.max()!) * 200, height: 20)
                            .foregroundColor(index % 2 == 0 ? .green : .yellow)
                            .animation(.linear, value: film.ratingTab)
                        Spacer()
                    }
                }
                HStack {
                    Spacer()
                    Text(String(format: "%.1f", film.rating))
                        .bold()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("main"))
                    Text("(\(totalReviews) Reviews)")
                }
                
                NavigationLink(destination: AddReviewView()) {
                    VStack {
                        Divider()
                        HStack {
                            Text("Add your own review !")
                                .foregroundColor(Color("TextColor"))
                            Spacer()
                            Image(systemName: "arrow.forward")
                                .foregroundColor(Color("main"))
                        }
                        .padding()
                        Divider()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                ForEach($film.review) { review in
                    ReviewDetailsView(review: review)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        }
    }
    
}

struct ReviewView_Previews: PreviewProvider {
    @State static var film = Film.sampleData[1]
    static var previews: some View {
        NavigationView {
            ReviewView(film: $film)
        }
    }
}
