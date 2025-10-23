//
//  SplashView.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.themeSecondary
                .ignoresSafeArea()
            
            VStack {
                Text("Store SwiftUI App")
                    .font(.title)
                    .foregroundStyle(.themePrimary)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    CoordinatorViewModel.shared.goToHome()
                }
            }
        }
    }


#Preview {
    SplashView()
}
