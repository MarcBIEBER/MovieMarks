//
//  Router.swift
//  MovieMarks
//
//  Created by Marc Bieber on 07/03/2024.
//

import Foundation

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .splashScreen
}

enum Page {
    case splashScreen
    case getStarted
    case mainView
}
