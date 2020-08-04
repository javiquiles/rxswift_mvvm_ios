//
//  HomeViewController.swift
//  BestMovies
//
//  Created by Javier Quiles on 21/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    private let viewModel: HomeViewModel
    private var model = HomeModel(movieList: [])
    private let router = HomeRouter()
    private let disposeBag = DisposeBag()

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.bind(view: self, router: router)
        tableView.register(UINib(nibName: String(describing: MovieCell.self), bundle: Bundle.main), forCellReuseIdentifier: "MovieCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        getData()
    }

    private func getData() {
        viewModel.fetchPopularMoview().subscribe(onSuccess: { model in
            self.model = model
            self.reloadTableView()
        }) { error in
            print(error)
        }.disposed(by: disposeBag)
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell else { return UITableViewCell() }
        cell.titleLabel.text = model.movieList[indexPath.row].title
        cell.descriptionLabel.text = model.movieList[indexPath.row].overview
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

extension HomeViewController: UITableViewDelegate {
    
}
