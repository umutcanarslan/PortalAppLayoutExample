//
//  GradientView.swift
//  PortalApp
//
//  Created by Umut Can Arslan on 16.04.2022.
//

import UIKit

class GradientView: UIView {

    var startColor: UIColor = .blue {
        didSet {
            updateGradient()
            setNeedsLayout()
        }
    }
    var endColor: UIColor = .red {
        didSet {
            updateGradient()
            setNeedsLayout()
        }
    }
    var locations: [CGFloat] = [0, 1] {
        didSet {
            updateGradient()
            setNeedsLayout()
        }
    }

    private var gradient: CGGradient?

    private func updateGradient() {
        let colorSpace = CGColorSpaceCreateDeviceRGB()

        gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: [startColor.cgColor, endColor.cgColor] as CFArray,
            locations: locations
        )
    }

    override func draw(_ rect: CGRect) {
        if gradient == nil {
            updateGradient()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let start = CGPoint(x: 0, y: 0)
        let end = CGPoint(x: 0, y: bounds.size.height)
        context.drawLinearGradient(
            gradient!,
            start: start,
            end: end,
            options: [.drawsBeforeStartLocation, .drawsBeforeStartLocation]
        )
    }
}
