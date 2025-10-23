//
//  ScreenSize.swift
//  Store
//
//  Created by Nikolas Gianoglou Coelho on 23/10/25.
//

import SwiftUI

class ScreenSize: ObservableObject {
    var width: CGFloat
    var height: CGFloat
    
    init(size: CGSize) {
        self.width = size.width
        self.height = size.height
    }
    init() {
        self.width = 393
        self.height = 669
    }
}
