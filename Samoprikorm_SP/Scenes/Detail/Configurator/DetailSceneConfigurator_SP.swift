//
//  DetailSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI

fileprivate let webViewDelegate = DetailSceneWebViewDelegate_SP()

struct DetailSceneConfigurator_SP {
    
    static func configure(card: ProductCard_SP) -> some View {
        return DetailScene_SP(card: card,
                              webViewDelegate: webViewDelegate)
    }
}
