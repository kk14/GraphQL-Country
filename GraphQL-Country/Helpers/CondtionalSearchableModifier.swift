//
//  CondtionalSearchableModifier.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 23/12/2022.
//

import SwiftUI

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    @ViewBuilder
    public func searchable<V, S>(
        if condition: Bool,
        text: Binding<String>,
        placement: SearchFieldPlacement = .automatic,
        prompt: S,
        @ViewBuilder suggestions: () -> V
    ) -> some View where V: View, S: StringProtocol {
        if condition {
            searchable(
                text: text,
                placement: placement,
                prompt: prompt,
                suggestions: suggestions)
        } else {
            self
        }
    }
}
