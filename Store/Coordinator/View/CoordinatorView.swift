//
//  CoordinatorView.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import Foundation

import SwiftUI

struct CoordinatorView: View {
    @StateObject var viewModel = CoordinatorViewModel.shared
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                switch viewModel.uiState {
                case .splash: SplashView()
                case .home: HomeView()
                }
            }
            .environmentObject(ScreenSize(size: geo.size))
        }
    }
}

#Preview {
    CoordinatorView()
}
