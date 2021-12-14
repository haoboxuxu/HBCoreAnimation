//
//  ViewController.swift
//  HBCoreAnimation
//
//  Created by haoboxuxu on 12/14/2021.
//  Copyright (c) 2021 haoboxuxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let demos: [String] = ["Tickle Me", "iBooks", "iPod Cover"]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HB Core Animation"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        demos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = demos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if demos[indexPath.row] == "Tickle Me" {
            let vc = TickleMeVC()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
