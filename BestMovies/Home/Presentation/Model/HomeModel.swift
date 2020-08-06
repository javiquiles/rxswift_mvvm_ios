//
//  HomeModel.swift
//  BestMovies
//
//  Created by Javier Quiles on 03/08/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

struct HomeModel {
    let movieList: [MovieModel]
}

struct MovieModel {
    let id: Int
    let title: String
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double
    let overview: String
    let releaseDate: String
    let image: String
}
