//
//  DropPDVDelegate.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 23/01/23.
//

import Foundation
import SwiftUI

@available(iOS 13.4, *)
struct DropPDVDelegate: DropDelegate {
    var pdvDroped: PDV
    var pdvManager: PDVWidgetManager
    
    init(pdvDroped: PDV, withManager pdvManager: PDVWidgetManager) {
        self.pdvManager = pdvManager
        self.pdvDroped = pdvDroped
    }
    
    
    func performDrop(info: DropInfo) -> Bool {
        pdvManager.currentPDV = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        let from = pdvManager.pdvs.firstIndex(where: { $0.id == pdvManager.currentPDV!.id })
        var to = pdvManager.pdvs.firstIndex(where: { $0.id == pdvDroped.id })
        if Int(to!) > Int(from!) {
            to! += 1
        }
        withAnimation {
            pdvManager.pdvs.move(fromOffsets: IndexSet(integer: from!), toOffset: to!)
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
