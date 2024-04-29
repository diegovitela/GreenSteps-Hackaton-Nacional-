//
//  SharedDataModel.swift
//  GreenSteps
//
//  Created by iOS Lab on 24/04/24.
//

import Foundation
import Combine

class SharedDataModel: ObservableObject {
    @Published var luz: Double = 0
    @Published var agua: Double = 0
    @Published var gas: Double = 0
    @Published var totalTonysCO2: Double = 0

    // Métodos para actualizar datos
    func updateLuz(value: Double, factor: Double) {
        luz += value * factor
        updateTotal()
    }
    
    func updateAgua(value: Double, factor: Double) {
        agua += value * factor
        updateTotal()
    }
    
    func updateGas(value: Double, factor: Double) {
        gas += value * factor
        updateTotal()
    }
    
    private func updateTotal() {
        totalTonysCO2 = luz + agua + gas
    }
}
