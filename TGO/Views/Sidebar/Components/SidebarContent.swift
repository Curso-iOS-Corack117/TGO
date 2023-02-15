//
//  SidebarContent.swift
//  TGO
//
//  Created by Sergio Ordaz Romero on 06/02/23.
//

import UIKit

class SidebarContent: UIView {
    private var outlookAuth = AuthenticationManager.shared
    var manager = SidebarNavigationManager.shared
    
    lazy var sidebarButtons: [UIView] = {
        let sidebarButtons = [
            SidebarButton(
                manager: manager,
                imageName: "material-menu",
                action: { self.manager.isOpened.toggle() }
            ),
            UIView(frame: .zero),
            SidebarButton(
                manager: manager,
                title: "Home",
                imageName: "material-home",
                action: { self.manager.viewType = .home }
            ),
            SidebarButton(
                manager: manager,
                title: "Agenda",
                imageName: "calendar-day",
                action: { self.manager.viewType = .agenda }
            ),
            SidebarButton(
                manager: manager,
                title: "Dashboard",
                imageName: "graph",
                action: { self.manager.viewType = .dashboard }
            ),
            SidebarButton(
                manager: manager,
                title: "Visita PDV",
                imageName: "metro-shop",
                action: { self.manager.viewType = .visita_pdv }
            ),
            UIView(frame: .zero),
            UIView(frame: .zero),
            SidebarButton(
                manager: manager,
                title: "Notificaciones",
                imageName: "bell.badge",
                isSystemImage: true,
                action: {
                    self.manager.isOpened = false
                    withAnimation(.spring()) {
                        NotificationPaneManager.shared.isShow.toggle()
                    }
                }
            ),
            SidebarButton(
                manager: manager,
                title: "Chat zeus",
                imageName: "charla",
                action: { self.manager.viewType = .chat_zeus }
            ),
            SidebarButton(
                manager: manager,
                title: "Ayuda",
                imageName: "open-question-mark",
                action: { self.manager.viewType = .ayuda }
            )
        ]
        return sidebarButtons
    }()
    
    lazy var vstack: UIStackView = {
        let vstack = UIStackView(arrangedSubviews: sidebarButtons)
        vstack.axis = .vertical
        vstack.alignment = .fill
        vstack.spacing = 20
        vstack.distribution = .fillEqually
        return vstack
    }()
    
    lazy var parentView: UIView = {
        let parentView = UIView(frame: .zero)
        parentView.addSubview(vstack)
        return parentView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(parentView)
        
        vstack.snp.makeConstraints { make in
            make.margins.equalToSuperview()
            make.width.greaterThanOrEqualTo(manager.BUTTON_HEIGHT)
        }
        
        parentView.backgroundColor = UIColor(named: "white-gray")
        parentView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        vstack.clipsToBounds = true
    }
}

#if DEBUG
import SwiftUI

@available(iOS 14, *)
struct SidebarContent_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        SidebarContent(frame: .zero).showPreview()
            .frame(alignment: .center)
            .ignoresSafeArea()
            .previewLayout(
                .fixed(
                    width: UIScreen.main.bounds.size.width * 0.3,
                    height: UIScreen.main.bounds.size.height
                )
            )
    }
}
#endif
