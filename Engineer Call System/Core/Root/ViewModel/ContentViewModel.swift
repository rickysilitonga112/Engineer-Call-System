//
//  ContentViewModel.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 18/10/23.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthServices.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
