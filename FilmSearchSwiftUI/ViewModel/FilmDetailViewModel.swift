//
//  FilmDetailViewModle.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import Foundation
import SwiftUI

class FilmDetailViewModel : ObservableObject {
    
    @Published var filmDetail : FilmdetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    
    func getFilmDetail(imdbId : String) {
        downloaderClient.filmDetailDownload(imdbId: imdbId) { (answer) in
            switch answer {
                case .failure(let hata):
                    print(hata)
                case .success(let filmDetail):
                    self.filmDetail = FilmdetailsViewModel(detail: filmDetail)
            }
        }
    }
}

struct FilmdetailsViewModel {
    let detail : FilmDetail
    
    
    
    var title : String {
        detail.title
    }
    var poster : String {
        detail.poster
    }
    var year : String {
        detail.year
    }
    var imdbId : String {
        detail.imdbId
    }
    var director : String {
        detail.director
    }
    var writer : String {
        detail.writer
    }
    var awards : String {
        detail.awards
    }
    var plot : String {
        detail.plot
    }
}
