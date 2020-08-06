//
//  Constants.swift
//  BestMovies
//
//  Created by Javier Quiles on 22/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

struct Constants {
    static let apiKey = "?api_key=f441ecb7123dcbb5c41647da34f09cc1"

    struct URL {
        static let base = "https://api.themoviedb.org/3/"
        static let images = "https://image.tmdb.org/t/p/w200"
    }

    struct Endpoints {
        static let listPopularMovies = "movie/popular"
        static let movieDetail = "movie"
    }
}
