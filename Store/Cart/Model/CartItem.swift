//
//  CartItem.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

struct CartItem: Identifiable, Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID().uuidString
    var product: Product
    var amount: Int
    var size: String
}

let MOCK_CART_PRODUCTS = [
    CartItem(product: Product(name: "MACAQUINHO ALFAIATARIA PEACE",
                              image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002581_614_catalog_1.jpg?1459536611",
                              regular_price: "R$ 149,90",
                              actual_price: "R$ 149,90",
                              on_sale: false,
                              sizes: [
                                ProductSize(available: false, size: "PP", sku: "5749_341_0_PP"),
                                ProductSize(available: true, size: "P", sku: "5749_341_0_P")
                              ]
                             ), amount: 1, size: "PP"),
    CartItem(product: Product(name: "T-SHIRT LEATHER DULL",
                              image: "",
                              regular_price: "R$ 139,90",
                              actual_price: "R$ 119,90",
                              on_sale: true,
                              sizes: [
                                ProductSize(available: true, size: "PP", sku: "5793_1000032_0_PP"),
                                ProductSize(available: true, size: "P", sku: "5793_1000032_0_P")
                              ]
                             ), amount: 3, size: "P"),
    CartItem(product: Product(name: "BOLSA FLAP TRIANGLE",
                              image: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002945_027_catalog_1.jpg?1459540966",
                              regular_price: "R$ 199,90",
                              actual_price: "R$ 159,90",
                              on_sale: true,
                              sizes: [
                                ProductSize(available: true, size: "U", sku: "6559_1000054_0_U"),
                              ]
                             ), amount: 5, size: "U")
]
