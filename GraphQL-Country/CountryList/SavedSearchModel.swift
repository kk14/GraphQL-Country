//
//  SavedSearchModel.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 23/12/2022.
//

import Foundation

struct SavedSearch: Identifiable {
    var id: UUID {
        UUID()
    }
    var text: String
}
