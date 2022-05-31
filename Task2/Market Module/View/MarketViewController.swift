//
//  View.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 19.04.22.
//

import Foundation
import UIKit

class MarketViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    //let refreshControl = UIRefreshControl()
    
    let viewModel = MarketViewModel()
    let cellID = "\(MarketCollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Market"
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
        getMarkets()
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
    
    fileprivate func getMarkets() {
        viewModel.getMarkets() {
            self.collectionView.reloadData()
        }
    }
//    func addRefreshControll() {
//        refreshControl.tintColor = .gray
//        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
//
//        collectionView.addSubview(refreshControl)
//    }
//    @objc func refreshData() {
//        getMarkets()
//        refreshControl.endRefreshing()
//        self.collectionView.reloadData()
//    }
}

extension MarketViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfLine()
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MarketCollectionViewCell
        cell.configure(market: viewModel.itemAtCell(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.bounds.width - 32)/2, height: 132)
    }
}
