//
//  Product.swift
//  NikeApp
//
//  Created by Алексей Зарицький on 17.07.2022.
//

import SwiftUI

// Product Model and sample Data....
struct Product: Identifiable{
    var id = UUID().uuidString
    var productImage: String
    var productTitle: String
    var productPrice: String
    var productBG: Color
    var isLiked: Bool = false
    var productRating: Int
}

var products = [

    Product(productImage: "p6", productTitle: "Nike Air Force 1", productPrice: "$240.0", productBG: Color("shoeBG1"), productRating: 4),
    Product(productImage: "p3", productTitle: "Air Jordan 1 Retro Hight", productPrice: "$550.0", productBG: Color("shoeBG2"),isLiked: true, productRating: 5),
    Product(productImage: "p2", productTitle: "Air Max Motion 2", productPrice: "$290.0", productBG: Color("shoeBG3"), productRating: 3),
    Product(productImage: "p5", productTitle: "Air Jordan 1 Mid SE", productPrice: "$250.0", productBG: Color("shoeBG4"), productRating: 4),
    Product(productImage: "p1", productTitle: "Nike Air Max 20", productPrice: "$240.0", productBG: Color("shoeBG5"), productRating: 3),
    Product(productImage: "p4", productTitle: "Air Force 1 x Off White", productPrice: "$1000.0", productBG: Color("shoeBG6"), productRating: 5),
]
