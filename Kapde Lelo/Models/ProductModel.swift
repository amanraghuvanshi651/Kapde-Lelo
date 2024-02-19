//
//  ProductModel.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 15/02/24.
//

import Foundation

struct ProductModel: Equatable {
    var id = UUID().uuidString
    var name: String
    var category: String
    var images: String
    var price: String
    var isLiked: Bool
}
