//
//  SidebarView.swift
//  TGO
//
//  Created by Sergio Ordaz Romero on 05/02/23.
//

import UIKit

class SidebarView: UIView {
    var sidebarManager = SidebarNavigationManager.shared
    
    lazy var sidebarContent: SidebarContent = {
        return SidebarContent(frame: .zero)
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.layer.opacity = 0.2
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        sidebarManager.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(backgroundView)
        addSubview(sidebarContent)
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        sidebarContent.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalTo(sidebarManager.isOpened ? sidebarManager.openWidth : sidebarManager.closedWidth)
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 14, *)
struct SidebarView_Preview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        SidebarView().showPreview()
            .background(Color.white)
            .ignoresSafeArea()
    }
}
#endif
