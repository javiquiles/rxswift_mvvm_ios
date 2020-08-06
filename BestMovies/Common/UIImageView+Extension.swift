//
//  UIImageView+Extension.swift
//  BestMovies
//
//  Created by Javier Quiles on 05/08/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import UIKit

extension UIImageView {

    func imageFromUrl(urlString: String) {

        if image == nil {
            image = UIImage(named: "movie")
        }

        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if let error = error {
                print(error)
            }

            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }.resume()
        
    }
}


