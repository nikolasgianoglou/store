//
//  CoordinatorViewModel.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

class CoordinatorViewModel: ObservableObject {
    @Published var uiState: CoordinatorUIState = .splash
    
    static let shared = CoordinatorViewModel()
    private init() {}
}

extension CoordinatorViewModel {
    func goToHome() {
        CoordinatorViewModel.shared.uiState = .home
    }
}
