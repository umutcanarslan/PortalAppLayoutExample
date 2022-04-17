//
//  PortalButton.swift
//  PortalApp
//
//  Created by Umut Can Arslan on 16.04.2022.
//

import UIKit

class PortalButton: UIButton {

    private static let ButtonHeight: CGFloat = 50

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configure() {
        backgroundColor = tintColor
        titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        titleLabel?.textColor = .white
        setTitleColor(.red, for: .selected)

        setContentHuggingPriority(.defaultHigh, for: .vertical)
        setContentHuggingPriority(.defaultHigh, for: .horizontal)

        layer.cornerRadius = 16
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attrTitle = NSAttributedString(
            string: title?.uppercased() ?? "",
            attributes: [.kern: 3 as NSNumber]
        )
        super.setAttributedTitle(attrTitle, for: state)
    }

    override func tintColorDidChange() {
        backgroundColor = tintColor
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .white : tintColor
            titleLabel?.textColor = isHighlighted ? tintColor : .white
        }
    }

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += Self.ButtonHeight / 0.6
        size.height = Self.ButtonHeight
        return size
    }

}
