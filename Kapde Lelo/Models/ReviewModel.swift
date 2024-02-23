//
//  ReviewModel.swift
//  Kapde Lelo
//
//  Created by macmini50 on 21/02/24.
//

import Foundation

struct ReviewModel: Identifiable {
    var id = UUID().uuidString
    var name: String
    var date: Date
    var rating: String
    var content: String
    var image: String
}
