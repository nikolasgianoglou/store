//
//  CustomStepper.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

struct CustomStepper: View {
    @Binding var amount: Int
    var onRemove: (() -> Void)?
    
    var body: some View {
        HStack (spacing: 8) {
            Button {
                if amount > 1 {
                    amount -= 1
                } else {
                    onRemove?()
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundStyle(Color.white)
                    .frame(width: 20, height: 20)
                    .background {
                        Circle()
                            .fill(Color.black.opacity(0.7))
                    }
            }

            
            Text("\(amount)")
                .font(.title3)
            
            Button {
                amount += 1
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.white)
                    .frame(width: 20, height: 20)
                    .background {
                        Circle()
                            .fill(Color.black.opacity(0.7))
                    }
            }
        }
    }
}

#Preview {
    CustomStepper(amount: .constant(1))
}
