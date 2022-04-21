//
//  NewsCollectionViewCell.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var resourceLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            backgroundColor = UIColor(red: 32/255, green: 33/255, blue: 36/255, alpha: 1)
            resourceLabel.textColor = .white
            titleLabel.textColor = .white
        } else {
            backgroundColor = .white
            resourceLabel.textColor = .black
            titleLabel.textColor = .black
        }
    }
    
    func configure(news: NewsElement) {
        resourceLabel.text = news.source
        titleLabel.text = news.title
        imageView.loadImage(imageURL: news.imgURL)
    }
}
