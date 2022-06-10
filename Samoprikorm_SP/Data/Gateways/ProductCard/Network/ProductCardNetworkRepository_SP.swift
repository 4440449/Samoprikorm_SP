//
//  ProductCardNetworkRepository_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 09.06.2022.
//

import BabyNet
import Foundation


protocol ProductCardsNetworkRepositoryProtocol_SP{
    func fetch(callback: @escaping (Result<[ProductCard_SP], Error>) -> ()) -> URLSessionTask?
}



final class ProductCardsNetworkRepository_SP: ProductCardsNetworkRepositoryProtocol_SP {
    
    private let client: BabyNetRepositoryProtocol
    private let apiKey: String
    
    init(client: BabyNetRepositoryProtocol,
         apiKey: String) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func fetch(callback: @escaping (Result<[ProductCard_SP], Error>) -> ()) -> URLSessionTask? {
        let url = BabyNetURL(scheme: .https,
                             host: "sruvmguuadrikxjglriw.supabase.co",
                             path: "/rest/v1/ProductCard",
                             endPoint: nil) //["id" : "eq.9c9513b81bdf4b6dbdcb7e62c3124d00"]
        let request = BabyNetRequest(method: .get,
                                     header: ["apiKey" : apiKey],
                                     body: nil)
        let session = BabyNetSession.default
        let decoderType = [ProductCardNetworkEntity_SP].self
        return client.connect(url: url,
                              request: request,
                              session: session,
                              decoderType: decoderType,
                              callback: callback)
    }
}
