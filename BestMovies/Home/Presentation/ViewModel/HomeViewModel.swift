//
//  HomeViewModel.swift
//  BestMovies
//
//  Created by Javier Quiles on 21/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import RxSwift

class HomeViewModel {

    private weak var view: HomeViewController?
    private var router: HomeRouter?
    private let repository: HomeRepositoryProtocol

    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }

    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }

    func fetchPopularMoview() -> Single<HomeModel> {
        return repository.getPopularMovies()
    }

}
