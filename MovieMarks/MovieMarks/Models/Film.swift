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
    
    var ratingTab: [Int] {
        
        // Initialize the array to hold counts for each rating from 0 to 5
        var ratingCounts = [Int](repeating: 0, count: 5)

        for review in self.review {  // Assuming 'reviews' is a collection of review objects
            if review.rate >= 1 && review.rate <= 5 {
                // Adjust the index to be zero-based when accessing ratingCounts
                ratingCounts[Int(review.rate) - 1] += 1
            } else {
                print("Invalid rating: \(review.rate). Ratings should be between 1 and 5.")
            }
        }
        
        return ratingCounts
        
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
        
        var dateStr: String {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter.string(from: date)
        }
        
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
        Film(title: "Superman",
             synopsis: "Just before the destruction of the planet Krypton, scientist Jor-El (Marlon Brando) sends his infant son Kal-El on a spaceship to Earth. Raised by kindly farmers Jonathan (Glenn Ford) and Martha Kent (Phyllis Thaxter), young Clark (Christopher Reeve) discovers the source of his superhuman powers and moves to Metropolis to fight evil. As Superman, he battles the villainous Lex Luthor (Gene Hackman), while, as novice reporter Clark Kent, he attempts to woo co-worker Lois Lane (Margot Kidder).",
             lengthInMinutes: 135,
             type: [
                "Horreur",
                "Romance"
             ],
             imageURL: "https://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT2xYTv3ig7zGLvs0ABliV1ZMWG-0waOX_P6nd03SJnDLVoTiSnvuCMJ-dNpQhhYXTC",
             review: [
                Review(name: "John", rate: 3, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 1, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Batman",
             synopsis: "Batman ventures into Gotham City's underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator's plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.",
             lengthInMinutes: 138,
             type: [
                "Romance"
             ],
             imageURL: "https://i.guim.co.uk/img/media/c8c00617b792d1d53f2d2b318820d5758dc61551/231_0_2968_1782/master/2968.jpg?width=1900&dpr=2&s=none",
             review: [
                Review(name: "John", rate: 3, comment: "Super filme", date: Date.now),
                Review(name: "Léa", rate: 5, comment: "Je recommande vivement", date: Date.now)
             ]),
        Film(title: "Joker",
             synopsis: "Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he's part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.",
             lengthInMinutes: 120,
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
             review: [
                Review(name: "Léa", rate: 1, comment: "Je recommande vivement", date: Date.now),
                Review(name: "Jean", rate: 1, comment: "Je recommande vivement", date: Date.now)
             ]
            )
    ]
}
