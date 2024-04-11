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
    private var storedRating: Double
    var type: [String]
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
    
    var rating: Double {
        if review.isEmpty {
            return 0.0
        } else {
            let totalRate = review.reduce(0) { $0 + $1.rate }
            return Double(totalRate) / Double(review.count)
        }
    }
    
    init(id: UUID = UUID(), title: String, synopsis: String, lengthInMinutes: Int, type: [String], imageURL: String, review: [Review]) {
        self.id = id
        self.title = title
        self.synopsis = synopsis
        self.lengthInMinutes = lengthInMinutes
        self.storedRating = 0.0
        self.type = type
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
        Film(title: "", synopsis: "", lengthInMinutes: 0, type: [], imageURL: "", review: [])
    }
}

extension Film {
    static let sampleData: [Film] =
    [
        Film(title: "Superman", synopsis: "C'est un super Hero", lengthInMinutes: 135,
             type: [
                "Horreur",
                "Romance"
             ],
             imageURL: "https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT2xYTv3ig7zGLvs0ABliV1ZMWG-0waOX_P6nd03SJnDLVoTiSnvuCMJ-dNpQhhYXTC",
             review: [
                Review(name: "John", rate: 3, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 1, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Batman", synopsis: "C'est un super Hero", lengthInMinutes: 138,
             type: [
                "Romance"
             ],
             imageURL: "https://i.guim.co.uk/img/media/c8c00617b792d1d53f2d2b318820d5758dc61551/231_0_2968_1782/master/2968.jpg?width=1900&dpr=2&s=none",
             review: [
                Review(name: "John", rate: 3, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 5, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Joker", synopsis: "C'est un super Vilain", lengthInMinutes: 120,
             type: [
                "Action"
             ],
             imageURL: "https://m.media-amazon.com/images/M/MV5BMGQ1ZGZmNTAtM2MyYi00NmZhLTkwYmYtNTNlZDRhMzU2ZTgwXkEyXkFqcGdeQW1yb3NzZXI@._V1_.jpg",
             review: [
                Review(name: "John", rate: 4, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 5, comment: "Je recommande vivement", date: Date.now),
                Review(name: "Jean", rate: 5, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Asterix", synopsis: "C'est un super golois", lengthInMinutes: 120,
             type: [
                "Action"
             ],
             imageURL: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/09/03/02/s0030-p0080-base-compo-comp-left.0108.jpg?width=1200",
             review: []
            )
    ]
}
