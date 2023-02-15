//
//  ViewController.swift
//  TGO
//
//  Created by Sergio Ordaz Romero on 08/02/23.
//

import UIKit

class ViewController: UIViewController {
    var sidebarManager = SidebarNavigationManager.shared
    
    lazy var sidebar: SidebarView = {
        let sidebar = SidebarView(frame: .zero)
        return sidebar
    }()
    
    lazy var bodyView: UIView = {
        let content = UIView(frame: .zero)
        return content
    }()
    
    lazy var contentView: UIView = {
        let content = UIView()
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let content = contentView
        let margins = view.layoutMarginsGuide
        
        content.addSubview(bodyView)
        content.addSubview(sidebar)
        view.addSubview(content)
        view.backgroundColor = .gray
        
        content.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        sidebar.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        bodyView.snp.makeConstraints { make in
            make.leading.equalTo(sidebarManager.closedWidth)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        updateMainView()
    }
    
    private func updateMainView() {
        var viewController = UIView(frame: .zero)
        for v in bodyView.subviews {
            v.removeFromSuperview()
        }
        
        switch sidebarManager.viewType {
            case .home:
                viewController = HomeView(frame: .zero)
            case .agenda:
                viewController = HomeView(frame: .zero)
            case .dashboard:
                viewController = HomeView(frame: .zero)
            case .visita_pdv:
                viewController = HomeView(frame: .zero)
            case .chat_zeus:
                viewController = HomeView(frame: .zero)
            case .ayuda:
                viewController = HomeView(frame: .zero)
        }
        bodyView.addSubview(viewController)
        viewController.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 14, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        ViewController().showPreview()
            .ignoresSafeArea()
    }
}
#endif
