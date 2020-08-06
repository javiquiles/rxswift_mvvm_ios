//
//  MovieRepresentation.swift
//  BestMovies
//
//  Created by Javier Quiles on 27/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

struct MovieRepresentation: Codable {
    let id: Int
    let title: String
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double
    let overview: String
    let releaseDate: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case image = "poster_path"
    }

    func toModel() -> MovieModel {
        return MovieModel(id: id, title: title, popularity: popularity,
                          voteCount: voteCount, voteAverage: voteAverage,
                          overview: overview, releaseDate: releaseDate, image: image)
    }
}
