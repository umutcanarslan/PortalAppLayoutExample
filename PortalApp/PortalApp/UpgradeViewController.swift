//
//  UpgradeViewController.swift
//  PortalApp
//
//  Created by Umut Can Arslan on 16.04.2022.
//

import UIKit
import SnapKit
import BonMot

let termsURL = URL(string: "https://portal.app")!

class UpgradeViewController: UIViewController {

    let background = BackgroundView()
    let contentStackView = UIStackView()
    let headerLabel = UILabel()
    let descriptionLabel = UILabel()
    let termsTextView = UITextView()
    let tryButton = PortalButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }

    private func configureSubviews() {
        configureLabel()
        configureButton()
        configureTerms()

        contentStackView.axis = .vertical
        contentStackView.spacing = 24
        contentStackView.alignment = .center
        contentStackView.distribution = .fill

        view.addSubview(background)
        view.addSubview(contentStackView)
        contentStackView.addSubview(headerLabel)
        contentStackView.addSubview(descriptionLabel)
        contentStackView.addSubview(termsTextView)

        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
        }
    }

}

extension UpgradeViewController {

    private func configureLabel() {
        headerLabel.numberOfLines = 0

        headerLabel.attributedText = "Unlock the World.\nFree for 7 Days.".styled(with: .headerStyle)
        contentStackView.addArrangedSubview(headerLabel)

        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        contentStackView.addArrangedSubview(descriptionLabel)

        descriptionLabel.attributedText = """
                Enjoy <bold>Full Access</bold> to the Portal Library.
                <bold>Free for 7 days, then £29.99/year.</bold>
            """.styled(with: .descriptionStyle)
    }

    private func configureButton() {
        tryButton.setTitle("Try it free", for: .normal)
        contentStackView.addArrangedSubview(tryButton)
        tryButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

    private func configureTerms() {
        let termsAttributedLabel = "By continuing you agree to our <terms>Terms &amp; Conditions</terms>. Portal members renews automatically unless auto-renew is turned off at least 24h before the trial period ends.".styled(with: .termsStyle)

        termsTextView.attributedText = termsAttributedLabel
        contentStackView.addArrangedSubview(termsTextView)

        termsTextView.linkTextAttributes = [
            .font: UIFont.systemFont(ofSize: 16, weight: .bold),
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue as NSNumber
        ]
        termsTextView.isScrollEnabled = false
        termsTextView.isEditable = false
        termsTextView.backgroundColor = .clear
    }
}

fileprivate extension BonMot.StringStyle {
    static var headerStyle: BonMot.StringStyle {
        StringStyle(
            .color(.white),
            .alignment(.center),
            .font(.boldSystemFont(ofSize: 36))
        )
    }

    static var descriptionStyle: BonMot.StringStyle {
        StringStyle(
            .color(.white),
            .alignment(.center),
            .font(.systemFont(ofSize: 20, weight: .ultraLight)),
            .xmlRules([.style("bold", .init(.font(.boldSystemFont(ofSize: 20))))])
        )
    }

    static var termsStyle: BonMot.StringStyle {
        StringStyle(
            .color(.white),
            .alignment(.center),
            .font(.systemFont(ofSize: 14, weight: .light)),
            .paragraphSpacingAfter(5),
            .xmlRules([.style("terms", termsLinkStyle)])
        )
    }

    static var termsLinkStyle: BonMot.StringStyle {
        StringStyle(
            .color(.white),
            .alignment(.center),
            .font(.systemFont(ofSize: 14, weight: .bold)),
            .underline(.single, nil),
            .link(termsURL)
        )
    }
}
