//
//  MainSceneConfigurator_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 05.06.2022.
//

import SwiftUI


struct MainSceneConfigurator_SP {
    
    static func configure(store: Store_SP, actionPool: ActionPool_SP) -> some View {
        return MainSceneView(store: store, actionPool: actionPool)
    }
}
