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
            PrivateImage(url: filmDetailViewModel.filmDetail?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.43, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            
            Text(filmDetailViewModel.filmDetail?.title ?? "Represent Film Name").padding().font(.title).foregroundColor(Color.blue)
            Text(filmDetailViewModel.filmDetail?.year ?? "Represent Film year").font(.footnote).foregroundColor(Color.gray)
            VStack(alignment: .leading){
                Text(filmDetailViewModel.filmDetail?.plot ?? "Represent Film Plot").padding()
                Text("Director:\(filmDetailViewModel.filmDetail?.director ?? "Represent Film Director")").padding(.leading).font(.footnote)
                Text("Writer:\(filmDetailViewModel.filmDetail?.writer ?? "Represent Film Writer")").padding(.leading).font(.footnote)
                Text("Awards:\(filmDetailViewModel.filmDetail?.awards ?? "Represent Film Awards")").padding(.leading).font(.footnote)
            }
            Spacer()
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
