//
//  Localizable.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation
import UIKit

extension String {
    func localizable() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
