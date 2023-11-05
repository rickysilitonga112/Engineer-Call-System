//
//  Item.swift
//  Engineer Call System
//
//  Created by Ricky Silitonga on 18/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
