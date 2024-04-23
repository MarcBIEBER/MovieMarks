//
//  DetailView.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

struct DragIndicator: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 40, height: 6)
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding()
    }
}


struct DetailView: View {
    @Binding var film: Film
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    DragIndicator()
                    // TODO: Faire un jolie composant avec l'image et les reviews et le genre du film comme sur figma
                    ZStack {
                        AsyncImage(url: URL(string: film.imageURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(12)
                                .padding()
                                .frame(maxHeight: 300)
                                .clipped()
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                                                   startPoint: .center,
                                                   endPoint: .bottom)
                                    .blur(radius: 10)
                                    .cornerRadius(12)
                                    .padding()
                                )
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text(film.type.joined(separator: " - "))
                                .foregroundColor(.white)
                            StarRatingView(rating: film.rating)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding()
                    }
                    
                    Divider()
                        .padding([.leading, .trailing])
                    
                    NavigationLink(destination: ReviewView(film: $film)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("See the review")
                                    .foregroundColor(Color("TextColor"))
                                    .font(.system(size: 16, weight: .heavy))
                                Spacer()
                                Text("You can write your own review")
                                    .foregroundColor(Color("TextColor"))
                                    .font(.system(size: 14, weight: .medium))
                            }
                            Spacer()
                            Image(systemName: "arrow.right")
                                .foregroundColor(Color("main"))
                                .font(.system(size: 28))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    Divider()
                        .padding([.leading, .trailing])
                    VStack(alignment: .leading) {
                        Text("Synopsis")
                            .foregroundColor(Color("main"))
                            .padding([.bottom])
                        Text(film.synopsis)
                            .font(.system(size: 16, weight: .light))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
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
