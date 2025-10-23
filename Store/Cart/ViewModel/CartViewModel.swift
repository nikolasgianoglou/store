//
//  CartViewModel.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products = [CartItem]()
    
    static let shared = CartViewModel()
    private init() {}
}

extension CartViewModel {
    func addProduct(item: CartItem) {
        if !products.contains(where: { $0 == item }) {
            products.append(item)
        }
    }
    
    func removeProduct(item: CartItem) {
        products.removeAll(where: { $0 == item })
    }
    
    func getTotalValue() -> String {
        var total: Double = 0
        
        for product in products {
            let priceString = product.product.actual_price.components(separatedBy: CharacterSet(charactersIn: "0123456789,.").inverted)
                .joined()
                .replacingOccurrences(of: ",", with: ".")
            
            if let value = Double(priceString) {
                total += Double(product.amount) * value
            }
        }
        
        return String(format: "R$ %.2f", total).replacingOccurrences(of: ".", with: ",")
    }
}
