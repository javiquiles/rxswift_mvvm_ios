//
//  HomeViewController.swift
//  BestMovies
//
//  Created by Javier Quiles on 21/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private let router = HomeRouter()
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }
        return cell
    }

}

extension HomeViewController: UITableViewDelegate {
    
}
