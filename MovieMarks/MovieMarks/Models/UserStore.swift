//
//  UserStore.swift
//  MovieMarks
//
//  Created by mathieu muty on 23/04/2024.
//

import SwiftUI

@MainActor
class UserStore: ObservableObject {
    @Published var user: [User] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("user.data")
    }

    func load() async throws {
        let task = Task<[User], Error> {
            let fileUrl = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            let user = try JSONDecoder().decode([User].self, from: data)
            return user
        }
        let user = try await task.value
        self.user = user
    }

    func save(user: [User]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(user)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
