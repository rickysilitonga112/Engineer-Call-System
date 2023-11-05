//
//  DashboardView.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 03/11/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            Text("Dashboard View")
            
            Button {
                AuthServices.shared.signOut()
            } label: {
                Text("Sign Out")
            }
        }
    }
}

#Preview {
    DashboardView()
}
