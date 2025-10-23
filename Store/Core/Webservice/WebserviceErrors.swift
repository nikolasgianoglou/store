//
//  WebserviceErrors.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

enum WebserviceErrors: LocalizedError {
    case invalidUrl, badRequest, decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl: return "Invalid URL."
        case .badRequest: return "Fail to make the request."
        case .decodingError: return "Error decoding JSON."
        }
    }
}
