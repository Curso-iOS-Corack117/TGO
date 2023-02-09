//
//  PDVWidgetManager.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 23/01/23.
//

import Foundation

class PDVWidgetManager: ObservableObject {
    
    static var shared = PDVWidgetManager()
    
    @Published var pdvs: [PDV] = [
        PDV(id: 172, nombrePDV: "TS Mega Villa Olímpica", nombreGerente: "Sergio Ordaz Romero", noEmpleadoGerente: 1067221, imageUrl: "sergio"),
        PDV(id: 2383, nombrePDV: "EKT MEXICALI", nombreGerente: "Marina Ivette Sánchez Villada", noEmpleadoGerente: 1080040, imageUrl: "marina"),
        PDV(id: 116, nombrePDV: "EKT CD JUAREZ TORRES", nombreGerente: "Luis Gerardo Díaz Diaz", noEmpleadoGerente: 1067208, imageUrl: "gera"),
        PDV(id: 175, nombrePDV: "TS Mega Villa Olímpica", nombreGerente: "Sergio Ordaz Romero", noEmpleadoGerente: 1067221, imageUrl: "sergio"),
        PDV(id: 176, nombrePDV: "TS Mega Villa Olímpica", nombreGerente: "Sergio Ordaz Romero", noEmpleadoGerente: 1067221, imageUrl: "sergio"),
        PDV(id: 177, nombrePDV: "TS Mega Villa Olímpica", nombreGerente: "Sergio Ordaz Romero", noEmpleadoGerente: 1067221, imageUrl: "sergio"),
        PDV(id: 178, nombrePDV: "TS Mega Villa Olímpica", nombreGerente: "Sergio Ordaz Romero", noEmpleadoGerente: 1067221, imageUrl: "sergio"),
        PDV(id: 179, nombrePDV: "TS Mega Villa Olímpica", nombreGerente: "Sergio Ordaz Romero", noEmpleadoGerente: 1067221, imageUrl: "sergio")
    ]
    @Published var currentPDV: PDV?
    
}
