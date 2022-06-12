//
//  ProductCard.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//

import Foundation
import UIKit


public struct ProductCard_SP: Identifiable {
    public let id: String
    let title: String
    let imagePath: String?
    let allergen: String
    let age: String
    let rating: String
    var image: UIImage? { willSet { print("image is loaded \(title)")} }
    var imageIsLoading: Bool = false
}
