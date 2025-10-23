//
//  Webservice.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

protocol WebServiceProtocol {
    static func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void)
}

class Webservice: WebServiceProtocol {
    static func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {
        guard let url = URL(string: url.rawValue) else {
            completion(.failure(WebserviceErrors.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(WebserviceErrors.badRequest))
                return
            }
            guard let list = try? JSONDecoder().decode(ProductList.self, from: data) else {
                completion(.failure(WebserviceErrors.decodingError))
                return
            }
            completion(.success(list))
        }.resume()
    }
    
    static func getProductsMock(completion: @escaping (Result<ProductList, Error>) -> Void) {
        let data = Data(PRODUCTS_REQUEST_MOCK.utf8)
        
        do {
            let list = try JSONDecoder().decode(ProductList.self, from: data)
            completion(.success(list))
        } catch {
            completion(.failure(WebserviceErrors.decodingError))
        }
    }
}
