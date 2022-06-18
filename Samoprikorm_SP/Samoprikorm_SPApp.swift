//
//  Samoprikorm_SPApp.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import SwiftUI
import BabyNet


let testCards =
[
    ProductCard_SP (id: "1", title: "Грейпфрут", imagePath: "grape", allergen: "Нет", age: "6+", rating: "🙂"),
    ProductCard_SP (id: "2", title: "Банан", imagePath: "banana", allergen: "Нет", age: "6+", rating: "🤩"),
    ProductCard_SP (id: "9c9513b81bdf4b6dbdcb7e62c3124d00", title: "Ягоды", imagePath: "berries", allergen: "Нет", age: "6+", rating: "🙁"),
    ProductCard_SP (id: "4", title: "Огурец", imagePath: "cucumber", allergen: "Нет", age: "6+", rating: "🙂"),
    ProductCard_SP (id: "5", title: "Киви", imagePath: "kiwi", allergen: "Нет", age: "6+", rating: "🙂"),
    ProductCard_SP (id: "6", title: "Апельсин", imagePath: "orange", allergen: "Да", age: "7+", rating: "😀"),
    ProductCard_SP (id: "7", title: "Помидор", imagePath: "tomato", allergen: "Да", age: "6+", rating: "🙂"),
]
let testState = State_SP(cards: testCards)
let testStore = Store_SP(initialState: testState, reducer: reducer)



let reducer = Reducer_SP()
let storeGlobal = Store_SP(initialState: nil, reducer: reducer)
let client = BabyNetRepository()
let apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNydXZtZ3V1YWRyaWt4amdscml3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTQ3ODgyMzgsImV4cCI6MTk3MDM2NDIzOH0.udc8nAU84lOWCgJChCCq815w0oBoXh6zrceObzg8Z1Q"
let network = ProductCardsNetworkRepository_SP(client: client, apiKey: apiKey)
let repository = ProductCardsRepository_SP(network: network)
let errorHandler = ErrorHandler_SP()
let actionPool = ActionPool_SP(store: storeGlobal, productCardRepository: repository, errorHandler: errorHandler)


@main
struct Samoprikorm_SPApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainSceneConfigurator_SP.configure(store: storeGlobal, actionPool: actionPool)
        }
    }
}
