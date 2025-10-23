//
//  HomeFilters.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

import Foundation

enum HomeFilters: CaseIterable {
    case all, onSale
    
    var text: String {
        switch self {
        case .all: return "all"
        case .onSale: return "on sale"
        }
    }
}


