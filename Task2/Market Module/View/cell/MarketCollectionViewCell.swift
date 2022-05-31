//
//  MarketCollectionViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import UIKit

class MarketCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var pairLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var exchangeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 10
        
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 0.8)
            pairLabel.textColor = .white
            priceLabel.textColor = .white
            exchangeLabel.textColor = .white
        } else {
            backgroundColor = .white
            pairLabel.textColor = .black
            priceLabel.textColor = .black
            exchangeLabel.textColor = .black
        }
    }
    
    func configure(market: Market) {
        pairLabel.text = market.pair
        priceLabel.text = "\(market.price.rounding())"
        exchangeLabel.text = market.exchange
    }
}
