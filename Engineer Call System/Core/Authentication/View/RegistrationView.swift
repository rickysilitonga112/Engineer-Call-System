//
//  RegistrationView.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 18/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var vm = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("Create an account")
                    .font(.largeTitle)
                
                Spacer()
            }
            .padding()
            
            Spacer()
                .frame(height: 60)
            
            // textfield
            VStack(spacing: 18) {
                TextField("Enter your email", text: $vm.email)
                    .modifier(ECSTextFieldModifier())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                TextField("Full Name", text: $vm.fullName)
                    .modifier(ECSTextFieldModifier())
                
                TextField("Username", text: $vm.username)
                    .modifier(ECSTextFieldModifier())
                
                SecureField("Password", text: $vm.password)
                    .modifier(ECSTextFieldModifier())
                
                SecureField("Confirm Password", text: $vm.confirmPassword)
                    .modifier(ECSTextFieldModifier())
                
            }
            .padding(.horizontal)
            
            
            Spacer()
            
            PrimaryECSButton(text: "Register") {
                Task {
                    try await vm.registerUser()
                }
            
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 2) {
                    Text("Already have an account? ")
                        .foregroundStyle(.secondary)
                    
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                }
                .font(.footnote)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
