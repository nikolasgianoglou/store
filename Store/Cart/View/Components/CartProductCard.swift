//
//  CartProductCard.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

struct CartProductCard: View {
    @Binding var item: CartItem
    
    var body: some View {
        HStack (spacing: 8) {
            CustomAsyncImage(product: item.product, size: 60)
            
            VStack (alignment: .leading) {
                Text(item.product.name)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.title3)
                    .bold()
                
                HStack {
                    Text("Size:")
                    
                    Text(item.size)
                        .bold()
                }
                .font(.subheadline)
                
                if item.product.on_sale {
                    HStack(spacing: 6) {
                        Text(item.product.regular_price)
                            .foregroundStyle(Color.black.opacity(0.6))
                            .strikethrough(true, color: Color.red)
                        Text(item.product.actual_price)
                            .bold()
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                } else {
                    Text(item.product.regular_price)
                        .bold()
                }
                
                
            }
            
            Spacer()
            
            CustomStepper(amount: $item.amount) {
                CartViewModel.shared.removeProduct(item: item)
            }

        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.2), radius: 5)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    ZStack {
        Color.themeSecondary
        CartProductCard(item: .constant(CartItem(product: MOCK_PRODUCTS[2], amount: 2, size: "PP")))
    }
}
