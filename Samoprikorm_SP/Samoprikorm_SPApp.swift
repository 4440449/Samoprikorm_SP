//
//  Samoprikorm_SPApp.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import SwiftUI

//let cards = [
//    ProductCard (id: UUID(), title: "Грейпфрут", imagePath: "grape", allergen: "Нет", age: "6+", rating: "🙂"),
//    ProductCard (id: UUID(), title: "Банан", imagePath: "banana", allergen: "Нет", age: "6+", rating: "🤩"),
//    ProductCard (id: UUID(), title: "Ягоды", imagePath: "berries", allergen: "Нет", age: "6+", rating: "🙁"),
//    ProductCard (id: UUID(), title: "Огурец", imagePath: "cucumber", allergen: "Нет", age: "6+", rating: "🙂"),
//    ProductCard (id: UUID(), title: "Киви", imagePath: "kiwi", allergen: "Нет", age: "6+", rating: "🙂"),
//    ProductCard (id: UUID(), title: "Апельсин", imagePath: "orange", allergen: "Да", age: "7+", rating: "😀"),
//    ProductCard (id: UUID(), title: "Помидор", imagePath: "tomato", allergen: "Да", age: "6+", rating: "🙂"),
//]

//let initialState = MainSceneState_SP(cards: cards)

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
