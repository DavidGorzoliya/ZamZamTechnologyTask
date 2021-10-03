//
//  Font.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation
import UIKit

extension UIFont {
    static func regular(size: CGFloat) -> UIFont? {
        return UIFont(name: "PTSans-Regular", size: size)
    }

    static func bold(size: CGFloat) -> UIFont? {
           return UIFont(name: "PTSans-Bold", size: size)
    }
}
