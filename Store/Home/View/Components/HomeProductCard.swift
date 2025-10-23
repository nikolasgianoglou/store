//
//  HomeProductCard.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

struct HomeProductCard: View {
    var product: Product
    @EnvironmentObject var screenSize: ScreenSize
    
    var body: some View {
        NavigationLink {
            HomeProductDetails(product: product)
        } label: {
            VStack {
                CustomAsyncImage(product: product, size: screenSize.width * 0.5)
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .bold()
                    
                    HStack {
                        if product.on_sale {
                            Text(product.regular_price)
                                .foregroundStyle(.gray)
                                .strikethrough(true, color: Color.red)
                        }
                        Spacer()
                        Text(product.actual_price)
                            .bold()
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                }
                .foregroundStyle(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    Color.themePrimary
                        .opacity(0.2)
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                }
            }
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.white)
                    .shadow(color: .gray.opacity(0.2), radius: 5)
            }
            .overlay(alignment: .topTrailing) {
                if product.on_sale {
                    Text("ONSALE!")
                        .lineLimit(1)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.themePrimary)
                        }
                        .padding(12)
                }
            }
        }
    }
}

#Preview {
    HomeProductCard(product: MOCK_PRODUCTS[2])
        .environmentObject(ScreenSize())
}

