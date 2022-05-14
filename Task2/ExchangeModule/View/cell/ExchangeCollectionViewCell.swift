//
//  ExchangeCollectionViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import UIKit

class ExchangeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 10
        
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            backgroundColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 0.8)
            nameLabel.textColor = .white
        } else {
            backgroundColor = .white
            nameLabel.textColor = .black
        }
    }
        
    func configure(exchange: String) {
        nameLabel.text = "   \(exchange)"
    }
}
