//
//  UnwrapOptionalBindedProperty.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 23/12/2022.
//

import Foundation
import SwiftUI

func ?? <T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
