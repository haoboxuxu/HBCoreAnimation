//
//  TickleMeVC.swift
//  HBCoreAnimation_Example
//
//  Created by 徐浩博 on 2021/12/14.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import HBCoreAnimation

class TickleMeVC: UIViewController {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(avatarImageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avatarImageView.addTickleMeGesture()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        avatarImageView.center = view.center
    }
}
