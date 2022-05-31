//
//  CoinCollectionViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import UIKit

class CoinCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var shortNameLabel: UILabel!
    
    
    @IBOutlet weak private var changingImageView: UIImageView!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var changedPrice1D: UILabel!
    
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
    
    
    
    func configure(coin: Coin) {
        if coin.priceChange1D > 0 {
            changedPrice1D.textColor = .green
        } else if coin.priceChange1D == 0 {
            changedPrice1D.textColor = .systemYellow
        } else {
            changedPrice1D.textColor = .red
        }
        
        nameLabel.text = coin.id.capitalized
        priceLabel.text = "$\(coin.price.rounding())"
        shortNameLabel.text = coin.symbol.uppercased()
        imageView.loadImage(imageURL: coin.icon)
        
        if coin.priceChange1D > 0 {
            changedPrice1D.text = "\(coin.priceChange1D.rounding())%"
            changingImageView.image = UIImage(named: "green")
        } else if coin.priceChange1D < 0 {
            changedPrice1D.text = "\(coin.priceChange1D.rounding())%"
            changingImageView.image = UIImage(named: "red")
        } else {
            changedPrice1D.text = "\(coin.priceChange1D.rounding())%"
            changingImageView.isHidden = true
        }
    }
}
