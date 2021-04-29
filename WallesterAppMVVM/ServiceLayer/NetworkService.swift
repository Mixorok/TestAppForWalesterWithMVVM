//
//  NetworkService.swift
//  WallesterAppMVVM
//
//  Created by Максим on 08.04.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getBeers(completion: @escaping (Result<[Beer]?, Error>) -> Void)
}

struct NetworkService: NetworkServiceProtocol {
    func getBeers(completion: @escaping (Result<[Beer]?, Error>) -> Void) {
        let urlString = "https://api.punkapi.com/v2/beers"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Beer].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
