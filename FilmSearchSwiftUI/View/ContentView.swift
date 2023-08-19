//
//  ContentView.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button {
            DownloaderClient().filmsDownload(search: "pulp") { sonuc in
                switch sonuc {
                    case .success(let filmArray):print(filmArray!)
                    case .failure(let hata):print(hata)
                }
            }
        } label: {
            Text("Test Yap")
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
