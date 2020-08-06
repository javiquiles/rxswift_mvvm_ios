//
//  HomeRepresentation.swift
//  BestMovies
//
//  Created by Javier Quiles on 27/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

struct HomeRepresentation: Codable {
    let movieList: [MovieRepresentation]

    enum CodingKeys: String, CodingKey {
        case movieList = "results"
    }

    func toModel() -> HomeModel {
        return HomeModel(movieList: movieList.map { representation in
            representation.toModel()
        })
    }
}
