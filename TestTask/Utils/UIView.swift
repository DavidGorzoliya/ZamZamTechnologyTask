//
//  UIView.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation
import UIKit

// MARK: - AutoLayout
extension UIView {
    func pinToSuperview() {
        guard let superview = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
    }

    func setDimensions(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func centerInSuperview() {
        guard let superview = superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
}

// MARK: - Shadow
extension UIView {
    func anonymousShadow() {
        layer.shadowColor = UIColor.cardAnonymous.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 5
    }

    func verifiedShadow() {
        layer.shadowColor = UIColor.cardVerified.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 5
    }

    func shadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
    }
}

// MARK: - UI elements
extension UIView {
    static func makeSeparatorLineView(height: CGFloat) -> UIView {
        let separatorLineView = UIView()
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.heightAnchor.constraint(equalToConstant: height).isActive = true
        return separatorLineView
    }
}
