//
//  CurrencyCollectionViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 21.04.22.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        layer.cornerRadius = 10
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 0.8)
            nameLabel.textColor = .white
            priceLabel.textColor = .white
        } else {
            backgroundColor = .white
            nameLabel.textColor = .black
            priceLabel.textColor = .black
        }
    }
    
    func configure(currency: Currency) {
        imageView.loadImage(imageURL: currency.imageURL)
        nameLabel.text = currency.name
        let price = String(format: "%.2f", currency.rate)
        priceLabel.text = "\(currency.symbol)\(price)"
    }

}
