//
//  SidebarNavigationManager.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 18/01/23.
//

import Foundation
import SwiftUI

class SidebarNavigationManager : ObservableObject {
    var viewType: ViewTypes = .home
    var isOpened: Bool
    var isShowUser: Bool
    var openWidth: CGFloat!
    var closedWidth: CGFloat!
    var sidebarWidth: CGFloat! {
        willSet {
            openWidth = newValue * self.OPENED_SIZE
            closedWidth = newValue * self.CLOSED_SIZE
        }
    }
    var delegate: SidebarView?
    
    static let shared = SidebarNavigationManager()
    
    
    var OPENED_SIZE: CGFloat {
        if UIDevice.current.orientation.isLandscape {
            return 0.3
        } else {
            return 0.4
        }
    }
    var CLOSED_SIZE: CGFloat {
        if UIDevice.current.orientation.isLandscape {
            return 0.06
        } else {
            return 0.07
        }
    }
    let BUTTON_HEIGHT: CGFloat = 40
    
    init(isOpened: Bool = false, isShowUser: Bool = false) {
        self.isOpened = isOpened
        self.isShowUser = isShowUser
        defer {
            self.sidebarWidth = UIScreen.main.bounds.size.width
        }
    }
    
    enum ViewTypes {
        case home
        case agenda
        case dashboard
        case visita_pdv
        case chat_zeus
        case ayuda
    }
}
