//
//  TableViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 18.04.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak private var imageeView: UIImageView!
    @IBOutlet weak private var  nameLabel: UILabel!
    @IBOutlet weak private var  symbolAndPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(coin: Coin?) {
        //self.imageeView.image = c
        nameLabel.text = coin?.name
        symbolAndPriceLabel.text = " \(coin?.id ?? "") - \(coin?.price ?? 0.0) "
    }
}
