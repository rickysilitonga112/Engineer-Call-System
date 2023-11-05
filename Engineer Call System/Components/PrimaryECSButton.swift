//
//  PrimaryECSButton.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 01/11/23.
//

import SwiftUI

struct PrimaryECSButton: View {
    let text: String
    let action: () -> Void
    
    
    var body: some View {
        
        Button(action: action, label: {
            RoundedRectangle(cornerRadius: 8)
                .overlay {
                    Text(text)
                        .font(.body)
                        .foregroundStyle(.white)
                }
        })
        .frame(height: 40)
    }
}

#Preview {
    PrimaryECSButton(text: "Register", action: {})
}
