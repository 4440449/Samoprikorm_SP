//
//  Action_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 01.06.2022.
//

import Foundation


//MARK: - Params

enum ActionParams_SP {
    case initialLoading
    case search(_ params: String)
    case select(_ params: ProductCard_SP)
}


//MARK: - Action with params

enum Action_SP {
    case initialLoading(_ action: InitialLoading_SP)
    case search(_ action: Search_SP)
    case select(_ action: Select_SP)
    case showError(_ action: Error_SP)
    
    struct InitialLoading_SP {
        let cards: [ProductCard_SP]
    }
    
    struct Search_SP {
        let text: String
    }

    struct Select_SP {
        let card: ProductCard_SP
    }
    
    struct Error_SP {
        let description: String
    }
}



//MARK: - Action Pool (Action + Middleware)

final class ActionPool_SP: ObservableObject {

    private let store: Store_SP
    private let productCardRepository: ProductCardGateway_SP
    
    init(store: Store_SP,
         productCardRepository: ProductCardGateway_SP) {
        self.store = store
        self.productCardRepository = productCardRepository
        print("INIT ActionPool_SP")
    }
    
    func dispatch(params: ActionParams_SP) {
        switch params {
            
        case .initialLoading:
            let _ = Task {
                do {
                    let cards = try await productCardRepository.fetch()
                    let successAction = Action_SP.initialLoading(.init(cards: cards))
                    store.dispatch(action: successAction)
                } catch let error {
                    let errAction = Action_SP.showError(.init(description: error.localizedDescription))
                    store.dispatch(action: errAction)
                }
            }
            
        case .search(let text):
            let action = Action_SP.search(.init(text: text))
            store.dispatch(action: action)
            
        case .select(card: let card):
            let action = Action_SP.select(.init(card: card))
            store.dispatch(action: action)
        }
    }
    
    deinit {
        print("DEINIT ActionPool_SP")
    }
}
