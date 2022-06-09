//
//  ProductCardGateway_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 09.06.2022.
//


protocol ProductCardGateway_SP {
    func fetch() async throws -> [ProductCard_SP]
}
