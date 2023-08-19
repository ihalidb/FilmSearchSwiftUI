//
//  FilmViewModel.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import Foundation
import SwiftUI

class FilmListViewModel : ObservableObject {
    @Published var films = [FilmViewModel]()
    let downloaderClient = DownloaderClient()
    
    func filmSearch(filmName : String) {
        downloaderClient.filmsDownload(search: filmName) { (answer) in
            switch answer {
                case.failure(let hata): print(hata)
                case.success(let filmArray): if let filmArray = filmArray {
                    DispatchQueue.main.async {
                        self.films = filmArray.map(FilmViewModel.init)
                    }
                }
            }
        }
    }
}

struct FilmViewModel {
    let film : Film
    
    var title : String {
        film.title
    }
    var poster : String {
        film.poster
    }
    var year : String {
        film.year
    }
    var type : String {
        film.type.capitalized
    }
    var imdbid : String {
        film.imdbID
    }
}
