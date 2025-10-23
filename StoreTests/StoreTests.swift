//
//  StoreTests.swift
//  StoreTests
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import XCTest
@testable import Store

class WebserviceMock: WebServiceProtocol {
    static func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {
        guard let jsonData = PRODUCTS_REQUEST_MOCK.data(using: .utf8) else {
            completion(.failure(WebserviceErrors.badRequest))
            return
        }
        guard let list = try? JSONDecoder().decode(ProductList.self, from: jsonData) else {
            completion(.failure(WebserviceErrors.decodingError))
            return
        }
        completion(.success(list))
    }
}

final class desafioAleloTests: XCTestCase {

    func test_should_make_sure_on_sale_filter_works_correctly() {
        let viewModel = HomeViewModel(manager: HomeManager(webservice: WebserviceMock()))
        viewModel.selectedFilter = .onSale
        let containsRegularProducts = viewModel.filteredProducts.contains(where: { !$0.on_sale })
        XCTAssertFalse(containsRegularProducts, "Should be false to show no regular products are included, only on sale.")
    }
    
    func test_should_make_sure_search_filter_works_correctly() {
        let viewModel = HomeViewModel(manager: HomeManager(webservice: WebserviceMock()))
        viewModel.searchField = "vestido"
        let containsNotSearchedProducts = viewModel.filteredProducts.contains(where: { !$0.name.contains(viewModel.searchField)})
        XCTAssertFalse(containsNotSearchedProducts, "Should be false to hide products that doesn't have the search text on it's name")
    }
    
    func test_total_price_should_match_cart_products() {
        let viewModel = CartViewModel.shared
        let mockProducts = MOCK_CART_PRODUCTS
        viewModel.products = mockProducts
        let productsTotalEqualsExpected = viewModel.getTotalValue() == "R$ 1309,10"
        XCTAssertTrue(productsTotalEqualsExpected, "Should be true if the total price is correct (using mock)")
    }
    
    func test_should_not_add_repeated_product() {
        let viewModel = CartViewModel.shared
        let mockProduct = MOCK_CART_PRODUCTS[0]
        viewModel.addProduct(item: mockProduct)
        viewModel.addProduct(item: mockProduct)
        XCTAssertTrue(viewModel.products.count == 1, "Should be true if repeated products are not beaing added again, which is correct")
    }
    
    func test_should_successfully_remove_product() {
        let viewModel = CartViewModel.shared
        let mockProducts = MOCK_CART_PRODUCTS
        viewModel.products = mockProducts
        viewModel.removeProduct(item: mockProducts[0])
        let viewModelContainsRemovedProduct = viewModel.products.contains(where: { $0 == mockProducts[0] })
        XCTAssertFalse(viewModelContainsRemovedProduct, "Should be false if the product was successfully removed")
    }
}
