//
//  Role.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 01/11/23.
//

import Foundation


enum Role: Identifiable, Codable, Hashable {
    var id: Self {
        return self
    }
    case defaultRole
    case admin
    case machineOperator
    case technician
    case engineer
    
    var title: String {
        switch self {
        case .admin:
            return "admin"
        case .machineOperator:
            return "operator"
        case .technician:
            return "technician"
        case .engineer:
            return "engineer"
        case .defaultRole:
            return "Default"
        }
    }
}
