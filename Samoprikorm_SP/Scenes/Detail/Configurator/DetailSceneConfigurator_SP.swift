//
//  DetailSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI


private let webViewDelegate = DetailSceneWebViewDelegate_SP()


struct DetailSceneConfigurator_SP: SceneConfiguratorProtocol_SP {
    
    static func configure() -> some View {
        return DetailScene_SP(store: store,
                              webViewDelegate: webViewDelegate)
    }
}