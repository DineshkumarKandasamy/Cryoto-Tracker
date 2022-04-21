//
//  DescriptionTableViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak private var imageVieww: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            backgroundColor = UIColor(red: 32/255, green: 33/255, blue: 36/255, alpha: 1)
            titleLabel.textColor = .white
            descLabel.textColor = .white
        } else {
            backgroundColor = .white
            titleLabel.textColor = .black
            descLabel.textColor = .black
        }
    }
    
    func configure(desc: NewsElement) {
        titleLabel.text = desc.title
        descLabel.text = desc.newsDescription
        imageVieww.loadImage(imageURL: desc.imgURL)
    }
}
