//
//  PDV.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 23/01/23.
//

import Foundation
import SwiftUI

class PDV: ObservableObject {
    var id: Int
    var nombrePDV: String
    var nombreGerente: String
    var noEmpleadoGerente: Int
    var imageUrl: String
    
    var idString: String {
        String("\(id)")
    }
    
    init(id: Int, nombrePDV: String, nombreGerente: String, noEmpleadoGerente: Int, imageUrl: String) {
        self.id = id
        self.nombrePDV = nombrePDV
        self.nombreGerente = nombreGerente
        self.noEmpleadoGerente = noEmpleadoGerente
        self.imageUrl = imageUrl
    }
    
    
    
}
