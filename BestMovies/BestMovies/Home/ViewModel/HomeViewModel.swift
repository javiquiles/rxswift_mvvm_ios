//
//  HomeViewModel.swift
//  BestMovies
//
//  Created by Javier Quiles on 21/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

class HomeViewModel {

    private weak var view: HomeViewController?
    private var router: HomeRouter?

    func bind(view: HomeViewController, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(view)
    }

}
