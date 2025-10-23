//
//  HomeManager.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

protocol HomeManagerProtocol {
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)
    func getProductsMock(completion: @escaping (Result<ProductList, Error>) -> Void)
}

class HomeManager: HomeManagerProtocol {
    let webservice: WebServiceProtocol
    
    init(webservice: WebServiceProtocol = Webservice()) {
        self.webservice = webservice
    }
    
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) {
        Webservice.getProducts(url: AppConstants.Urls.productList, completion: completion)
    }
    
    func getProductsMock(completion: @escaping (Result<ProductList, any Error>) -> Void) {
        Webservice.getProductsMock(completion: completion)
    }
}
