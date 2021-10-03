//
//  Card.swift
//  TestTask
//
//  Created by Давид Горзолия on 10/3/21.
//

import Foundation

struct Card {

    var type: CardType = .anonymous
    var maximumAccountBalance: String = ""
    var maximumCreditBalance: String = ""

    static func makeRandomInstances() -> [Card] {
        return [
            Card(type: .anonymous,
                 maximumAccountBalance: "15 000 ₽",
                 maximumCreditBalance: "40 000 ₽"),

            Card(type: .verified,
                 maximumAccountBalance: "60 000 ₽",
                 maximumCreditBalance: "200 000 ₽")
        ]
    }
}
