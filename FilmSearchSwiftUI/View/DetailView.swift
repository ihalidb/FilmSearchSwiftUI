//
//  DetailView.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import SwiftUI

struct DetailView: View {
    let imdbId : String
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    var body: some View {
        VStack {
            Text(filmDetailViewModel.filmDetail?.plot ?? "Film Plot Gösterilecek")
        }.onAppear {
            self.filmDetailViewModel.getFilmDetail(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "Test")
    }
}
