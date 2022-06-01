//
//  Samoprikorm_SPApp.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import SwiftUI



@main
struct Samoprikorm_SPApp: App {
    
    let store = MainSceneStore_SP(initialState: nil,
                                  reducer: MainSceneReducer_SP())
    var body: some Scene {
        WindowGroup {
            MainSceneView(store: store)
        }
    }
}
