//
//  ExchangeViewController.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import UIKit

class ExchangesViewController: UIViewController {
    
    let viewModel = ExchangesViewModel()
    let cellID = "\(ExchangeCollectionViewCell.self)"

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Exchanges"
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        viewModel.getExchanges {
            self.collectionView.reloadData()
        }
    }

}

extension ExchangesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfExchanges()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ExchangeCollectionViewCell
        cell.configure(exchange: viewModel.itemAtCell(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.bounds.width * 0.92), height: 50)
    }
    
    
    
    
}
