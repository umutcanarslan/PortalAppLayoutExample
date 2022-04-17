//
//  BackgroundView.swift
//  PortalApp
//
//  Created by Umut Can Arslan on 16.04.2022.
//

import UIKit
import SnapKit

class BackgroundView: CustomView {

    let image = UIImageView(image: UIImage(named: "background"))
    let fadeToBlack = GradientView()
    let box = UIView()

    override func setupView() {
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true

        fadeToBlack.isOpaque = false
        fadeToBlack.startColor = .clear
        fadeToBlack.endColor = .black
        fadeToBlack.locations = [0.25, 0.6]

        box.backgroundColor = .green

        addSubview(image)
        addSubview(fadeToBlack)
        addSubview(box)

        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }

        fadeToBlack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
}
