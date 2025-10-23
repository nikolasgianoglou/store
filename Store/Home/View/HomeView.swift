//
//  HomeView.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.themeSecondary
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // MARK: Search + Cart
                HStack(spacing: 16) {
                    textfield
                    cartIcon
                }
                .padding(.horizontal)
                
                // MARK: Filters
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(HomeFilters.allCases, id: \.self) { filter in
                            filterItem(filter: filter)
                        }
                    }
                    .padding()
                }
                
                // MARK: Products
                ScrollView {
                    VStack {
                        ForEach(viewModel.filteredProducts) { prod in
                            HomeProductCard(product: prod)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

extension HomeView {
    var textfield: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.black.opacity(0.3))
            TextField("Search", text: $viewModel.searchField)
        }
        .frame(height: 50)
        .padding(.horizontal, 8)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black.opacity(0.3))
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
            }
            .shadow(color: .gray.opacity(0.2), radius: 5)
        }
    }
    var cartIcon: some View {
        NavigationLink {
            CartView()
        } label: {
            Image(systemName: "cart")
                .foregroundStyle(Color.black.opacity(0.5))
                .frame(width: 50, height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                }
        }
    }
    func filterItem(filter: HomeFilters) -> some View {
        Button {
            viewModel.selectedFilter = filter
        } label: {
            Text(filter.text)
                .foregroundStyle(viewModel.selectedFilter == filter ? Color.white : Color.black.opacity(0.5))
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(viewModel.selectedFilter == filter ? .themePrimary : .white)
                }
        }
    }
}

#Preview {
    HomeView()
}

