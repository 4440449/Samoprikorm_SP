//
//  Action_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 01.06.2022.
//

import Foundation
import UIKit


//MARK: - Params

enum ActionParams_SP {
    case initialLoading
    case imageLoading(_ card: ProductCard_SP)
    case search(_ text: String)
//    case select(_ card: ProductCard_SP)
}


//MARK: - Action with params

enum Action_SP {
    case initialLoading(_ action: InitialLoading_SP)
    case imageLoading(_ action: ImageLoading_SP)
    case search(_ action: Search_SP)
//    case select(_ action: Select_SP)
    case showError(_ action: Error_SP)
    case isLoading(_ action: IsLoading_SP)
    case isLoadingImage(_ action: IsLoadingImage_SP)
    
    struct InitialLoading_SP {
        let cards: [ProductCard_SP]
    }
    
    struct Search_SP {
        let text: String
    }

//    struct Select_SP {
//        let card: ProductCard_SP
//    }
    
    struct Error_SP {
        let description: String
    }
    
    struct IsLoading_SP {
        let status: Bool
    }
    
    struct ImageLoading_SP {
        let card: ProductCard_SP
        let image: UIImage
    }
    
    struct IsLoadingImage_SP {
        let card: ProductCard_SP
        let status: Bool
    }
    
}



//MARK: - Action Pool (Action + Middleware)

final class ActionPool_SP: ObservableObject {

    private let store: Store_SP
    private let productCardRepository: ProductCardGateway_SP
    
//    private var tasks = [Task<Void, Never>]() { willSet { print("tasks count == \(tasks.count)")} }
//    private var tasks: TaskGroup<Any>
    
    init(store: Store_SP,
         productCardRepository: ProductCardGateway_SP) {
        self.store = store
        self.productCardRepository = productCardRepository
        print("INIT ActionPool_SP")
    }
    
    func dispatch(params: ActionParams_SP) {
        switch params {
            
        case .initialLoading:
            let isloadingAction = Action_SP.isLoading(.init(status: true))
            store.dispatch(action: isloadingAction)
            let _ = Task {
                do {
                    let cards = try await productCardRepository.fetch()
//                    sleep(10)
                    let successAction = Action_SP.initialLoading(.init(cards: cards))
                    store.dispatch(action: successAction)
                } catch let error {
                    let errAction = Action_SP.showError(.init(description: "\(error)"))
                    store.dispatch(action: errAction)
                }
                let isloadingAction = Action_SP.isLoading(.init(status: false))
                store.dispatch(action: isloadingAction)
            }
            
        case .search(let text):
            let action = Action_SP.search(.init(text: text))
            store.dispatch(action: action)
            
//        case .select(card: let card):
//            let action = Action_SP.select(.init(card: card))
//            store.dispatch(action: action)
            
        case .imageLoading(let card):
            guard (card.image == nil && card.imageIsLoading == false) else { return }
            let action = Action_SP.isLoadingImage(.init(card: card, status: true))
            store.dispatch(action: action)
            let _ = Task {
                do {
                    let data = try await productCardRepository.fetchImage(for: card)
//                    sleep(UInt32.random(in: 0..<2))
                    guard let uiImage = UIImage(data: data) else {
                        throw ActionError_SP.imageConvert(description: "received data --> \(data) <-- cannot be convert to UIImage")
                    }
//                    let image = Image(uiImage: uiImage)
                    let successAction = Action_SP.imageLoading(.init(card: card, image: uiImage))
                    store.dispatch(action: successAction)
                } catch {
                    let errorImageAction = Action_SP.imageLoading(.init(card: card, image: UIImage(named: "alert")!))
                    
                    store.dispatch(action: errorImageAction)
                }
                let action = Action_SP.isLoadingImage(.init(card: card, status: false))
                store.dispatch(action: action)
            }
//            }
//            tasks.append(task)
        }
    }
    
    enum ActionError_SP: Error {
        case imageConvert(description: String)
    }
    
    deinit {
        print("DEINIT ActionPool_SP")
    }
}
