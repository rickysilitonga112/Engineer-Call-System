//
//  ECSTextFieldModifier.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 20/10/23.
//

import Foundation
import SwiftUI

struct ECSTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 12)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray6), lineWidth: 2)
            }
    }
}
