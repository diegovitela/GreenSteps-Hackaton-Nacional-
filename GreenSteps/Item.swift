//
//  Item.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
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
