//
//  PaymentCardModel.swift
//  Kapde Lelo
//
//  Created by macmini50 on 28/02/24.
//

import Foundation

struct PaymentCardModel {
    var id = UUID().uuidString
    var number: String
    var bank: String
    var username: String
    var bgImage: String
    var cardType: CardProvider
}
