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
let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNydXZtZ3V1YWRyaWt4amdscml3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTQ3ODgyMzgsImV4cCI6MTk3MDM2NDIzOH0.udc8nAU84lOWCgJChCCq815w0oBoXh6zrceObzg8Z1Q"
let network = ProductCardsNetworkRepository_SP(client: client, apiKey: apiKey)
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
