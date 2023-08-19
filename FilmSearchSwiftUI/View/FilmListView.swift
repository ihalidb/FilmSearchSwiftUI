//
//  ContentView.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel : FilmListViewModel
    
    init() {
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.filmSearch(filmName: "friends")
    }
    
    var body: some View {
        NavigationView{
            List(filmListViewModel.films, id: \.imdbid) { film in
                HStack {
                    PrivateImage(url: film.poster)
                        .frame(width: 90, height: 120)
                    VStack (alignment: .leading){
                        Text(film.title)
                            .font(.title2)
                            .foregroundColor(Color.blue)
                        Text(film.year)
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                        Text("Type: \(film.type)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }.navigationTitle(Text("Search Film"))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            FilmListView()
        }
    }
}
