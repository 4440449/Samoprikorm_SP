//
//  MainSceneState_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//

import Foundation


struct MainSceneState_SP {
    var cards = [
        ProductCard (id: UUID(), title: "Грейпфрут", imagePath: "grape", allergen: "Нет", age: "6+", rating: "🙂"),
        ProductCard (id: UUID(), title: "Банан", imagePath: "banana", allergen: "Нет", age: "6+", rating: "🤩"),
        ProductCard (id: UUID(), title: "Ягоды", imagePath: "berries", allergen: "Нет", age: "6+", rating: "🙁"),
        ProductCard (id: UUID(), title: "Огурец", imagePath: "cucumber", allergen: "Нет", age: "6+", rating: "🙂"),
        ProductCard (id: UUID(), title: "Киви", imagePath: "kiwi", allergen: "Нет", age: "6+", rating: "🙂"),
        ProductCard (id: UUID(), title: "Апельсин", imagePath: "orange", allergen: "Да", age: "7+", rating: "😀"),
        ProductCard (id: UUID(), title: "Помидор", imagePath: "tomato", allergen: "Да", age: "6+", rating: "🙂"),
    ]
}


