//
//  DetailSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI


struct DetailSceneConfigurator_SP {
    
    static func configure(store: Store_SP) -> some View {
        let webViewDelegate = DetailSceneWebViewDelegate_SP()
        return DetailScene_SP(store: store,
                              webViewDelegate: webViewDelegate)
    }
}
