//
//  CircularViewModifier.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 19/12/2022.
//

import SwiftUI

struct CicrcularViewModifier: ViewModifier {
    var size: CGSize = CGSizeZero
    func body(content: Content) -> some View {
        content
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: 4)
                    .frame(width: size.width, height: size.height)
            }
            .shadow(radius: 7)
    }
}

extension View {
    func circeOverlay(withSize size: CGSize) -> some View {
        return modifier(CicrcularViewModifier(size: size))
    }
}
