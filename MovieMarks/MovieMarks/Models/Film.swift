//
//  Film.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import Foundation

struct Film: Identifiable, Codable {
    let id: UUID
    var title: String
    var synopsis: String
    var lengthInMinutes: Int
    var rating: Double
    var imageURL: String
    var review: [Review]
    
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    
    init(id: UUID = UUID(), title: String, synopsis: String, lengthInMinutes: Int, rating: Double, imageURL: String, review: [Review]) {
        self.id = id
        self.title = title
        self.synopsis = synopsis
        self.lengthInMinutes = lengthInMinutes
        self.rating = rating
        self.imageURL = imageURL
        self.review = review
    }
}

extension Film {
    struct Review: Identifiable, Codable {
        let id: UUID
        var name: String
        var rate: Int
        var comment: String
        var date: Date
        
        init(id: UUID = UUID(), name: String, rate: Int, comment: String, date: Date) {
            self.id = id
            self.name = name
            self.rate = rate
            self.comment = comment
            self.date = date
        }
    }
    
    static var emptyFilm: Film {
        Film(title: "", synopsis: "", lengthInMinutes: 0, rating: 0.0, imageURL: "", review: [])
    }
}

extension Film {
    static let sampleData: [Film] =
    [
        Film(title: "Superman", synopsis: "C'est un super Hero", lengthInMinutes: 135, rating: 4.5,
             imageURL: "https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT2xYTv3ig7zGLvs0ABliV1ZMWG-0waOX_P6nd03SJnDLVoTiSnvuCMJ-dNpQhhYXTC",
             review: [
                Review(name: "John", rate: 3, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 5, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Batman", synopsis: "C'est un super Hero", lengthInMinutes: 138, rating: 2,
             imageURL: "https://i.guim.co.uk/img/media/c8c00617b792d1d53f2d2b318820d5758dc61551/231_0_2968_1782/master/2968.jpg?width=1900&dpr=2&s=none",
             review: [
                Review(name: "John", rate: 3, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 5, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Joker", synopsis: "C'est un super Vilain", lengthInMinutes: 120, rating: 5,
             imageURL: "https://m.media-amazon.com/images/M/MV5BMGQ1ZGZmNTAtM2MyYi00NmZhLTkwYmYtNTNlZDRhMzU2ZTgwXkEyXkFqcGdeQW1yb3NzZXI@._V1_.jpg",
             review: [
                Review(name: "John", rate: 5, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 5, comment: "Je recommande vivement", date: Date.now)
             ])
    ]
}
