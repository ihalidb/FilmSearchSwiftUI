//
//  ContentView.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import SwiftUI

struct FilmListView: View {
    @ObservedObject var filmListViewModel : FilmListViewModel
    
    @State var searchFilm = ""
    
    init() {
        self.filmListViewModel = FilmListViewModel()
        
    }
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Search Films", text: $searchFilm, onEditingChanged:{ _ in}, onCommit: {
                    self.filmListViewModel.filmSearch(filmName: searchFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchFilm)
                }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
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
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            FilmListView()
        }
    }
}
