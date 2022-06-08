//
//  Samoprikorm_SPApp.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import SwiftUI

let reducer = Reducer_SP()
let store = Store_SP(initialState: nil, reducer: reducer)
let networkGateway = NetworkGateway_SP()
let actionPool = ActionPool_SP(store: store, networkGateway: networkGateway)


@main
struct Samoprikorm_SPApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainSceneConfigurator_SP.configure(store: store, actionPool: actionPool)
        }
    }
}
