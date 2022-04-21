//
//  NewsViewController.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = NewsViewModel()
    let cellID = "\(NewsCollectionViewCell.self)"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        viewModel.getNews {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            view.backgroundColor = .black
            collectionView.backgroundColor = .clear
        } else {
            view.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 241/255, alpha: 1)
            collectionView.backgroundColor = .clear
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            view.backgroundColor = .black
            collectionView.backgroundColor = .clear
        } else {
            view.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 241/255, alpha: 1)
            collectionView.backgroundColor = .clear
        }
    }
}

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfLines()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NewsCollectionViewCell
        cell.configure(news: viewModel.itemAtCell(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width * 0.92, height: 136)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let descriptionVC = storyboard?.instantiateViewController(withIdentifier: "\(DescriptionViewController.self)") as! DescriptionViewController
        descriptionVC.newsDesc = viewModel.itemAtCell(index: indexPath.row)
        navigationController?.show(descriptionVC, sender: nil)
    }
}
