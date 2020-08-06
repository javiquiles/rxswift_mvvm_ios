//
//  HomeRepository.swift
//  BestMovies
//
//  Created by Javier Quiles on 27/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import RxSwift

protocol HomeRepositoryProtocol {
    func getPopularMovies() -> Single<HomeModel>
}

class HomeRepository: HomeRepositoryProtocol {

    func getPopularMovies() -> Single<HomeModel> {
        return Single.create { single in
            let url = URL(string: Constants.URL.base + Constants.Endpoints.listPopularMovies + Constants.apiKey)!
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    single(.error(error))
                }

                guard let data = data, let response = response as? HTTPURLResponse else { return }

                switch response.statusCode {
                case 200:
                    do {
                        let representation = try JSONDecoder().decode(HomeRepresentation.self, from: data)
                        single(.success(representation.toModel()))
                    } catch let error {
                        single(.error(error))
                    }
                default:
                    break
                }
            }

            task.resume()

            return Disposables.create { task.cancel() }
        }
    }

}
