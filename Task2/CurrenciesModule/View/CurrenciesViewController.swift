//
//  CurrenciesViewController.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import UIKit

class CurrenciesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    //let refreshControl = UIRefreshControl()
    let cellID = "\(CurrencyCollectionViewCell.self)"
    let viewModel = CurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currencies"
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        viewModel.getCurrencies {
            self.collectionView.reloadData()
        }
        //addRefreshControll()
    }
    override func viewWillAppear(_ animated: Bool) {
        //addRefreshControll()
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
    
//    func addRefreshControll() {
//        refreshControl.tintColor = .gray
//        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
//
//        collectionView.addSubview(refreshControl)
//    }
//    @objc func refreshData() {
//        viewModel.getCurrencies {
//            self.collectionView.reloadData()
//        }
//        refreshControl.endRefreshing()
//        self.collectionView.reloadData()
//    }

}

extension CurrenciesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CurrencyCollectionViewCell
        cell.configure(currency: viewModel.itemAtCell(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.bounds.width - 32)/2, height: 132)
    }
    
    
    
    
    
    
}
