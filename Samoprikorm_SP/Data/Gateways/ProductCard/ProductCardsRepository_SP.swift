//
//  ProductCardsRepository_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 09.06.2022.
//

import Foundation


final class ProductCardsRepository_SP: ProductCardGateway_SP {
    
    let network: ProductCardsNetworkRepositoryProtocol_SP
    
    init(network: ProductCardsNetworkRepositoryProtocol_SP) {
        self.network = network
    }
    
    func fetch() async throws -> [ProductCard_SP] {
        return try await withCheckedThrowingContinuation({ continuation in
            sleep(1)
            let _ = network.fetch { result in
                switch result {
                case let .success(cards): continuation.resume(returning: cards)
                case let .failure(error): continuation.resume(throwing: error); print(error)
                }
            }
        })
    }
}
