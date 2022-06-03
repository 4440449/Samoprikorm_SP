//
//  ProductCard.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import Foundation


struct ProductCard: Identifiable {
    let id: UUID
    let title: String
    let imagePath: String
    let allergen: String
    let age: String
    let rating: String
}
