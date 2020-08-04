//
//  HomeRouter.swift
//  BestMovies
//
//  Created by Javier Quiles on 21/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit

class HomeRouter {

    private var sourceView: UIViewController?

    var viewController: UIViewController {
        return resolveViewController()
    }

    private func resolveViewController() -> UIViewController {
        let viewController = HomeViewController(viewModel: resolveViewModel())
        return viewController
    }

    private func resolveViewModel() -> HomeViewModel {
        return HomeViewModel(repository: HomeRepository())
    }

    func setSourceView(_ sourceView: UIViewController?) {
        guard let sourceView = sourceView else { return }
        self.sourceView = sourceView
    }

}
