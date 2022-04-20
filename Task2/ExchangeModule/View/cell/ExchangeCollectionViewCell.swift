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
        backgroundColor = .gray.withAlphaComponent(0.3)
    }
    
    
    func configure(exchange: String) {
        layer.cornerRadius = 10
        backgroundColor = .gray.withAlphaComponent(0.3)
        nameLabel.text = "  \(exchange)"
    }

}
