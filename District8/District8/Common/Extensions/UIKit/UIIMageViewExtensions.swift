//
//  UIIMageViewExtensions.swift
//  YourStylist
//
//  Created by Hodi Zsuzsa on 2021. 04. 08..
//  Copyright © 2021. Sunsugar Media. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                if image.size.width > UIScreen.main.bounds.width {
                    self?.image = image.resize(toWidth: UIScreen.main.bounds.width)
                } else {
                self?.image = image
                }
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
