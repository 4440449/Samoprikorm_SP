//
//  MainSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI

struct MainSceneConfigurator_SP: SceneConfiguratorProtocol_SP {
    
    static func configure() -> some View {
        return MainSceneView(store: store)
    }
}
