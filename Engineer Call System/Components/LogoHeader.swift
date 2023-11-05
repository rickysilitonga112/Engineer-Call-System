//
//  LogoHeader.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 01/11/23.
//

import SwiftUI

struct LogoHeader: View {
    let logoSize: CGFloat = CGFloat(120)
    
    var body: some View {
        VStack(spacing: 12) {
            Image("app_logo")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: logoSize, height: logoSize)
            
            
            VStack(spacing: 6){
                Text("Engineer")
                Text("Call System")
            }
            .font(.title2)
            .fontWeight(.bold)
            
            
        }
    }
}

#Preview {
    LogoHeader()
}
