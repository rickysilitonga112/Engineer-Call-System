//
//  LoginView.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 18/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
               
                LogoHeader()
                
                Spacer()
                    .frame(height: 60)
                
                // FORM
                VStack(spacing: 18) {
                    TextField("Enter your email", text: $vm.email)
                        .modifier(ECSTextFieldModifier())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $vm.password)
                        .modifier(ECSTextFieldModifier())
                        
                }
                .padding(.horizontal)
                
                Spacer()
                
                PrimaryECSButton(text: "Login") {
                    Task { try await vm.login() }
                }
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account? ")
                            .foregroundStyle(.secondary)
                        
                        Text("Register")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                    }
                    .font(.footnote)
                }
            }
            
        }
    }
}

#Preview {
    LoginView()
}
