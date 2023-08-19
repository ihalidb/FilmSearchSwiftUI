//
//  DownloaderClient.swift
//  FilmSearchSwiftUI
//
//  Created by İbrahim Halid Bayrak on 19.08.2023.
//

import Foundation

class DownloaderClient {
    func filmsDownload(search: String, completion: @escaping (Result<[Film]?,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=dd129f68") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDCome))
            }
            guard let filmAnswer = try? JSONDecoder().decode(importFilms.self, from: data) else {
                return completion(.failure(.dataDProcess))
            }
            completion(.success(filmAnswer.films))
        }.resume()
    }
    
    func filmDetailDownload(imdbId: String, completion: @escaping (Result<FilmDetail,DownloaderError>) -> Void) {
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=dd129f68") else {
            return completion(.failure(.wrongUrl))
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.dataDCome))
            }
            guard let filmDetailAnswer = try? JSONDecoder().decode(FilmDetail.self.self, from: data) else {
                return completion(.failure(.dataDProcess))
            }
            completion(.success(filmDetailAnswer))
        }.resume()
    }
}

enum DownloaderError: Error {
    case wrongUrl
    case dataDCome
    case dataDProcess
}
