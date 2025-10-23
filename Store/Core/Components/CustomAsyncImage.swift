//
//  CustomAsyncImage.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

struct CustomAsyncImage: View {
    var product: Product
    var size: CGFloat
    
    var body: some View {
        Group {
            if let url = URL(string: product.image) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ZStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.themePrimary.opacity(0.6))
                            .padding(size / 5)
                        
                        ProgressView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.themePrimary.opacity(0.6))
                    .padding(size / 5)
            }
        }
        .frame(height: size)
    }
}

#Preview {
    CustomAsyncImage(product: MOCK_PRODUCTS[0], size: 60)
}
