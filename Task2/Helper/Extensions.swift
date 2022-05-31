//
//  UIImageView+Extension.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import UIKit

extension UIImageView {
    func loadImage(imageURL: String) {
        if let url = URL(string: imageURL) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data )
                    }
                }
            }
        }
    }
}

extension Double {
    func rounding () -> String {
        return String(format: "%.2f", abs(self))
    }
}

extension String {
    func replace() -> String {
        return replacingOccurrences(of: " ", with: "-")
    }
}
