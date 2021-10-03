//
//  VerticalSubCardView.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation
import UIKit

final class VerticalSubCardView: UIView {

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = "15000 Р"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return titleLabel
    }()

    let subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.textColor = .white
        subTitleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return subTitleLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDimensions(width: 160, height: 80)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true

        addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
    }
}
