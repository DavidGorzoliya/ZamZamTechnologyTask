//
//  CardTableViewCell.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation
import UIKit

enum CardType {
    case anonymous
    case verified
}

final class CardTableViewCell: UITableViewCell {

    static let identifier = "CardTableViewCell"
    
    let cardView: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .cardAnonymous
        cardView.anonymousShadow()
        
        return cardView
    }()

    let cardTitleLabel: UILabel = {
        let cardTitleLabel = UILabel()
        cardTitleLabel.text = "anonymous".localizable()
        cardTitleLabel.textColor = .white
        cardTitleLabel.font = .bold(size: 30)
        return cardTitleLabel
    }()

    let statusView = HorizontalSubCardView()
    let phoneVerifiedView = HorizontalSubCardView()
    let separatorLineView = UIView.makeSeparatorLineView(height: 0.3)
    let maxAccountBalanceView = VerticalSubCardView()
    let maxCreditBalanceView = VerticalSubCardView()

    var isCardStatusAnonymous: Bool {
        return cardType == .anonymous
    }

    var cardType: CardType = .anonymous {
        didSet {
            updateUI()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        phoneVerifiedView.iconCaptionLabel.text = "phone_verified".localizable()
        maxAccountBalanceView.subTitleLabel.text = "max_account_balance".localizable()
        maxCreditBalanceView.subTitleLabel.text = "max_credit_balance".localizable()
        cardView.layer.cornerRadius = 12
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateUI() {
        cardView.backgroundColor = isCardStatusAnonymous ? .cardAnonymous : .cardVerified
        cardTitleLabel.textColor = isCardStatusAnonymous ? .white : .darkGray
        phoneVerifiedView.iconCaptionLabel.textColor = isCardStatusAnonymous ? .white : .systemGray
        statusView.iconCaptionLabel.textColor = isCardStatusAnonymous ? .white : .systemGray
        statusView.iconImageView.tintColor = isCardStatusAnonymous ? .white : .darkGray
        separatorLineView.backgroundColor = isCardStatusAnonymous ? .white : .lightGray
        maxAccountBalanceView.titleLabel.textColor = isCardStatusAnonymous ? .white : .darkGray
        maxAccountBalanceView.subTitleLabel.textColor = isCardStatusAnonymous ? .white : .systemGray
        maxCreditBalanceView.titleLabel.textColor = isCardStatusAnonymous ? .white : .darkGray
        maxCreditBalanceView.subTitleLabel.textColor = isCardStatusAnonymous ? .white : .systemGray

        statusView.iconImageView.image = statusView.iconImageView.image?.withRenderingMode(.alwaysTemplate)
        statusView.iconImageView.image = isCardStatusAnonymous ? UIImage(named: "card") : UIImage(named: "id-card")
        phoneVerifiedView.iconImageView.image = phoneVerifiedView.iconImageView.image?.withRenderingMode(.alwaysTemplate)
        phoneVerifiedView.iconImageView.tintColor = isCardStatusAnonymous ? .white : .darkGray

        if isCardStatusAnonymous {
            cardTitleLabel.text = "anonymous".localizable()
            statusView.iconCaptionLabel.text = "virtual_card".localizable()
            cardView.anonymousShadow()
        } else {
            cardTitleLabel.text = "confirmed".localizable()
            statusView.iconCaptionLabel.text = "authentication_passed".localizable()
            cardView.verifiedShadow()
        }
    }
    
    private func layout() {
        contentView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Offset.top).isActive = true
        cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Offset.left).isActive = true
        cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Offset.right).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Offset.bottom).isActive = true
        
        cardView.addSubview(cardTitleLabel)
        cardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTitleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10).isActive = true
        cardTitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true

        cardView.addSubview(statusView)
        statusView.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 20).isActive = true
        statusView.leftAnchor.constraint(equalTo: cardTitleLabel.leftAnchor).isActive = true

        cardView.addSubview(phoneVerifiedView)
        phoneVerifiedView.topAnchor.constraint(equalTo: statusView.topAnchor).isActive = true
        phoneVerifiedView.leftAnchor.constraint(equalTo: statusView.rightAnchor, constant: 40).isActive = true

        cardView.addSubview(separatorLineView)
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 16).isActive = true
        separatorLineView.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        separatorLineView.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true

        cardView.addSubview(maxAccountBalanceView)
        maxAccountBalanceView.translatesAutoresizingMaskIntoConstraints = false
        maxAccountBalanceView.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 16).isActive = true
        maxAccountBalanceView.leftAnchor.constraint(equalTo: statusView.leftAnchor).isActive = true

        cardView.addSubview(maxCreditBalanceView)
        maxCreditBalanceView.translatesAutoresizingMaskIntoConstraints = false
        maxCreditBalanceView.topAnchor.constraint(equalTo: maxAccountBalanceView.topAnchor).isActive = true
        maxCreditBalanceView.leftAnchor.constraint(equalTo: phoneVerifiedView.leftAnchor).isActive = true
    }
}
