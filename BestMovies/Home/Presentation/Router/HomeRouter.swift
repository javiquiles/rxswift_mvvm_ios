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
        let viewController = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
        return viewController
    }

    func setSourceView(_ sourceView: UIViewController?) {
        guard let sourceView = sourceView else { return }
        self.sourceView = sourceView
    }

}
