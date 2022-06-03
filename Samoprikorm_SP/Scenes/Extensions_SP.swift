//
//  Extensions.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 03.06.2022.
//

import Foundation
import SwiftUI


extension Text {
    func title () -> some View {
        self.font(.custom("Montserrat-Regular", size: 28, relativeTo: .title))
            .fontWeight(.bold)
    }
}

extension Text {
    func title2 () -> some View {
        self.font(.custom("Montserrat-Regular", size: 16, relativeTo: .title2))
            .fontWeight(.bold)
    }
}

extension Text {
    func body() -> some View {
        self.font(.custom("Montserrat-Regular", size: 16, relativeTo: .body))
            .lineSpacing(1.33)
    }
}

extension Text {
    func callout() -> some View {
        self.font(.custom("Montserrat-Regular", size: 12, relativeTo: .callout))
            .lineSpacing(1.33)
    }
}
