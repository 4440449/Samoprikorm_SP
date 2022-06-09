//
//  Samoprikorm_SPApp.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import SwiftUI
import BabyNet

let reducer = Reducer_SP()
let store = Store_SP(initialState: nil, reducer: reducer)
let client = BabyNetRepository()
let network = ProductCardsNetworkRepository_SP(client: client)
let repository = ProductCardsRepository_SP(network: network)
let actionPool = ActionPool_SP(store: store, productCardRepository: repository)


@main
struct Samoprikorm_SPApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainSceneConfigurator_SP.configure(store: store, actionPool: actionPool)
        }
    }
}
