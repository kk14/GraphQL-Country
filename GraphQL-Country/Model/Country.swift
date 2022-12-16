//
//  Country.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import Foundation

struct Country: Codable {
    var code: String
    var name: String
    var emoji: String
    var isFavourite: Bool
}
