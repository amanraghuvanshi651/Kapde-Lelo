//
//  CardProvider.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 19/02/24.
//

import Foundation

enum CardProvider: String {
    case visa
    case mastercard
    case rupay
    
    func getTitle() -> String {
        switch self {
        case .visa:
            return "Visa"
        case .mastercard:
            return "Mastercard"
        case .rupay:
            return "RuPay"
        }
    }
}
