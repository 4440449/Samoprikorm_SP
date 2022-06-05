//
//  Samoprikorm_SPApp.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import SwiftUI


let store = MainSceneStore_SP(initialState: nil,
                              reducer: MainSceneReducer_SP())

@main
struct Samoprikorm_SPApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainSceneView(store: store)
        }
    }
}
