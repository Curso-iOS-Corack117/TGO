//
//  DropCalendarDelegate.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 24/01/23.
//

import Foundation
import SwiftUI

@available(iOS 14, *)
struct DropCalendarDelegate: DropDelegate {
    @Binding var isDropping: Bool
    @State private var id: Int?
    
    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: [.url]).first {
            _ = item.loadObject(ofClass: String.self) { data, _ in
                if let id = data {
                    DispatchQueue.main.async {
                        self.id = Int(id)
                    }
                }
            }
        }
        withAnimation {
            isDropping = false
        }
        return true
    }
    
    func dropEntered(info: DropInfo) {
        withAnimation {
            isDropping = true
        }
    }
    
    func dropExited(info: DropInfo) {
        withAnimation {
            isDropping = false
        }
    }
}
