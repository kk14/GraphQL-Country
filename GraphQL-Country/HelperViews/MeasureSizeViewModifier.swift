//
//  MeasureSizeViewModifier.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 19/12/2022.
//

import SwiftUI

struct MeasureSizeViewModifier: ViewModifier {
    let callBack: (CGSize) -> (Void)

    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear() {
                            callBack(proxy.size)
                        }
                }
            }
    }
}
extension View {
    func measureSize(_ callBack: @escaping (CGSize) -> (Void)) -> some View {
        modifier(MeasureSizeViewModifier(callBack: callBack))
        
    }
}
