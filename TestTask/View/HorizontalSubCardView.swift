//
//  HorizontalSubCardView.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation
import UIKit

final class HorizontalSubCardView: UIView {

    let iconImageView = UIImageView()

    let iconCaptionLabel: UILabel = {
        let iconCaptionLabel = UILabel()
        iconCaptionLabel.text = "virtual_card".localizable()
        iconCaptionLabel.textColor = .white
        iconCaptionLabel.font = UIFont.boldSystemFont(ofSize: 10)
        iconCaptionLabel.numberOfLines = 2
        iconCaptionLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return iconCaptionLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setDimensions(width: 120, height: 40)
        iconImageView.image = UIImage(named: "phone")
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true

        addSubview(iconCaptionLabel)
        iconCaptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconCaptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconCaptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8).isActive = true
    }
}
