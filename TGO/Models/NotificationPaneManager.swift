//
//  NotificationPaneManager.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 27/01/23.
//

import Foundation
import SwiftUI

class NotificationPaneManager: ObservableObject {
    @Published var isShow: Bool
    @Published var offsetShowed: CGSize = .zero
    @Published var offsetHidden: CGSize = .zero
    @Published var paneHeight: CGFloat = 0
    @Published var paneWidth: CGFloat = 0
    @Published var paneSize: CGFloat = 0 {
        willSet {
            paneWidth = newValue
            paneHeight = newValue * 1.2
            offsetHidden = CGSize(width: -paneWidth * 1.2, height: paneHeight * 1.2)
        }
    }
    
    static let shared = NotificationPaneManager()
    
    init(isShow: Bool = false) {
        self.isShow = isShow
    }
}
