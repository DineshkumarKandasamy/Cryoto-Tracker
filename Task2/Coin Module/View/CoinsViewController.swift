//
//  ViewController.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 18.04.22.
//

import UIKit

class CoinsViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let refreshControl = UIRefreshControl()
    let cellID = "\(CoinCollectionViewCell.self)"
    let viewModel = CoinsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        title = "Coins"
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        
        getCoins()
        addRefreshControll()
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
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "coinTabSelected"), object: nil, queue: nil) { [weak self] _ in
            self?.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
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
    
    fileprivate func getCoins() {
        viewModel.getCoins {
            self.collectionView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    //MARK: Refresh Control
    
    func addRefreshControll() {
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    @objc func refreshData() {
        viewModel.resetValues()
        collectionView.reloadData()
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { [weak self] _ in
            self?.getCoins()
        }
    }
}

extension CoinsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CoinCollectionViewCell
        cell.configure(coin: viewModel.itemsAtCell(index: indexPath.row)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width * 0.92, height: 64)
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let marketVC = storyboard?.instantiateViewController(withIdentifier: "MarketViewController") as! MarketViewController
        marketVC.viewModel.coinId = viewModel.itemsAtCell(index: indexPath.row)?.name.lowercased().replace()
        navigationController?.show(marketVC, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == viewModel.numberOfRowsInSection()-1 {
            getCoins()
        }
    }
}
