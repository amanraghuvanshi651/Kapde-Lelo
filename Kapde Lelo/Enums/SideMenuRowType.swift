//
//  SideMenuRowType.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 15/02/24.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable{
    case mode
    case information
    case password
    case order
    case card
    case wishlist
    case setting
//    case logout
    
    var title: String{
        switch self {
        case .mode:
            return "Dark Mode"
        case .information:
            return "Account Information"
        case .password:
            return "Password"
        case .order:
            return "Order"
        case .card:
            return "My Cards"
        case .wishlist:
            return "Wishlist"
        case .setting:
            return "Setting"
//        case .logout:
//            return "Logout"
        }
    }
    
    var iconName: String{
        switch self {
        case .mode:
            return "mode"
        case .information:
            return "information"
        case .password:
            return "password"
        case .order:
            return "order"
        case .card:
            return "card"
        case .wishlist:
            return "Bag"
        case .setting:
            return "setting"
//        case .logout:
//            return "logout"
        }
    }
}
