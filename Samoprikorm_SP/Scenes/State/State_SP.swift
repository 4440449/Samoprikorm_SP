//
//  State_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//

//import Foundation


struct State_SP {
    var searchFieldText = ""
    var selectedCard: ProductCard?
    var cards = [
        ProductCard (id: "1", title: "Грейпфрут", imagePath: "grape", allergen: "Нет", age: "6+", rating: "🙂"),
        ProductCard (id: "2", title: "Банан", imagePath: "banana", allergen: "Нет", age: "6+", rating: "🤩"),
        ProductCard (id: "9c9513b81bdf4b6dbdcb7e62c3124d00", title: "Ягоды", imagePath: "berries", allergen: "Нет", age: "6+", rating: "🙁"),
        ProductCard (id: "4", title: "Огурец", imagePath: "cucumber", allergen: "Нет", age: "6+", rating: "🙂"),
        ProductCard (id: "5", title: "Киви", imagePath: "kiwi", allergen: "Нет", age: "6+", rating: "🙂"),
        ProductCard (id: "6", title: "Апельсин", imagePath: "orange", allergen: "Да", age: "7+", rating: "😀"),
        ProductCard (id: "7", title: "Помидор", imagePath: "tomato", allergen: "Да", age: "6+", rating: "🙂"),
    ]
}

