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
    func fetchImage(for card: ProductCard_SP, callback: @escaping (Result<Data, Error>) -> ()) -> URLSessionTask?
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
    
    // Скорректировать УРЛЫ!
    func fetchImage(for card: ProductCard_SP, callback: @escaping (Result<Data, Error>) -> ()) -> URLSessionTask? {
        guard let imagePath = card.imagePath else { return nil }
        guard let url = URL(string: imagePath) else { return nil }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, resp, err in
            print("1 *** \(Thread.current)")
            callback(.success(data!))
        }
        task.resume()
        return task
//        //https://sruvmguuadrikxjglriw.supabase.co/storage/v1/object/sign/images/tomato.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWFnZXMvdG9tYXRvLnBuZyIsImlhdCI6MTY1NDg5NjY1NSwiZXhwIjoxOTcwMjU2NjU1fQ.Y9vVD4PytgGWdCUiBEwMkat6ptbz7e6KPn_dfPRAEm8
//
//        //https://sruvmguuadrikxjglriw.supabase.co/storage/v1/object/public/imagesfree/potato.png
//        let url = BabyNetURL(scheme: .https,
//                             host: "sruvmguuadrikxjglriw.supabase.co",
//                             path: "/storage/v1/object/public/imagesfree/potato.png",
//                             endPoint: nil) //["id" : "eq.9c9513b81bdf4b6dbdcb7e62c3124d00"]
//        let request = BabyNetRequest(method: .get,
//                                     header: ["" : ""],
//                                     body: nil)
//        let session = BabyNetSession.default
//        let decoderType = Data.self
//        return client.connect(url: url,
//                              request: request,
//                              session: session,
//                              decoderType: decoderType,
//                              callback: callback)
    }
    
}
