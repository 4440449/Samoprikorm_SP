//
//  State_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//


struct State_SP {
    var searchFieldText = ""
//    var selectedCard: ProductCard_SP?
    var cards = [ProductCard_SP]()
//    {
//        willSet { print(" ---> \(cards.forEach({ print($0.title) })) <---") }
//    }
    var errorMessage = ""
//    {
//        willSet { print("errorMessage ---> \(errorMessage) <---") }
//    }
//    var isDisplayingError = false
    var isLoading = false
    
    init(cards: [ProductCard_SP]?) {
        guard let cards = cards else { return }
        self.cards = cards
    }
}
