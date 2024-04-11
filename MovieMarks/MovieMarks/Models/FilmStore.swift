//
//  FilmStore.swift
//  MovieMarks
//
//  Created by Marc Bieber on 10/04/2024.
//

import SwiftUI

@MainActor
class FilmStore: ObservableObject {
    @Published var film: [Film] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("film.data")
    }
    
    func load() async throws {
        let task = Task<[Film], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let film = try JSONDecoder().decode([Film].self, from: data)
            return film
        }
        let film = try await task.value
        self.film = film
    }
    
    func save(film: [Film]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(film)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
