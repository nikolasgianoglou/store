//
//  HomeViewModel.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var selectedFilter: HomeFilters = .all
    @Published var searchField = ""
    var manager: HomeManagerProtocol
    
    init(manager: HomeManagerProtocol = HomeManager()) {
        self.manager = manager
        getProductList()
    }
}

extension HomeViewModel {
    var filteredProducts: [Product] {
        var filteredProducts: [Product] = self.products
        if selectedFilter == .onSale {
            filteredProducts = filteredProducts.filter { $0.on_sale }
        }
        if !searchField.isEmpty {
            filteredProducts = filteredProducts.filter { $0.name.lowercased().contains(searchField.lowercased()) }
        }
        return filteredProducts
    }
    func getProductList() {
        guard products.isEmpty else { return }
        manager.getProductsMock { result in
            switch result {
            case .success(let list):
                DispatchQueue.main.async {
                    self.products = list.products
                }
            case .failure(let error): print("error: \(error)")
            }
        }
    }
}
