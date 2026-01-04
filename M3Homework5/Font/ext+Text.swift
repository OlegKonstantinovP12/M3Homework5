//
//  ext+Text.swift
//  M3Homework5
//
//  Created by Oleg Konstantinov on 04.01.2026.
//

import SwiftUI

enum Poppins: String {
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
}

extension Text {
    func poppins(_ font: Poppins, size: CGFloat) -> some View {
        self
            .font(.custom(font.rawValue, size: size))
    }
}

//Poppins - ["Poppins-Regular", "Poppins-Medium", "Poppins-SemiBold"]
