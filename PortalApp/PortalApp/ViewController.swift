//
//  ViewController.swift
//  PortalApp
//
//  Created by Umut Can Arslan on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let upgradeViewController = UpgradeViewController()
        present(upgradeViewController, animated: true, completion: nil)
    }


}

