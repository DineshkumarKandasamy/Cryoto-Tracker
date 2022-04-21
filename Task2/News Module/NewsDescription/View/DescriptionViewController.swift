//
//  DescriptionViewController.swift
//  Task2
//
//  Created by Rufan Abdurahmanov on 20.04.22.
//

import UIKit
import SafariServices

class DescriptionViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    let cellID = "\(DescriptionTableViewCell.self)"
    
    var newsDesc: NewsElement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 241/255, alpha: 1)
        
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
//        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            view.backgroundColor = .black
            tableView.backgroundColor = .clear
        } else {
            view.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 241/255, alpha: 1)
            tableView.backgroundColor = .clear
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            view.backgroundColor = .black
//            tableView.backgroundColor = .clear
            tableView.backgroundColor = UIColor(red: 32/255, green: 33/255, blue: 36/255, alpha: 1)
        } else {
            view.backgroundColor = UIColor(red: 238/255, green: 237/255, blue: 241/255, alpha: 1)
            tableView.backgroundColor = .clear
        }
    }
    
    @IBAction func linkButtonClicked(_ sender: Any) {
        if let url = URL(string: newsDesc.link) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}

extension DescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DescriptionTableViewCell
        cell.configure(desc: newsDesc!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
