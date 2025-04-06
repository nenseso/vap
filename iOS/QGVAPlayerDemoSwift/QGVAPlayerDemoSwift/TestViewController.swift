//
//  TestViewController.swift
//  QGVAPlayerDemoSwift
//
//  Created by nenseso zhou on 2025/4/6.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Hello, this is a test view controller!"
        label.textAlignment = .center
        label.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 200)
        label.backgroundColor = .lightGray
        self.view.addSubview(label)
    }
    


}
