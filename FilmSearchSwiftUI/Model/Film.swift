//
//  Film.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import Foundation

struct Film : Codable {
    
    let title : String
    let year : String
    let imdbID : String
    let type : String
    let poster : String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct importFilms : Codable {
    let films : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case films = "Search"
    }
    
}


