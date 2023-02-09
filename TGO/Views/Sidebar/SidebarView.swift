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

    override init(frame: CGRect) {
        super.init(frame: frame)
        sidebarManager.delegate = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(sidebarContent)
                
        sidebarContent.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(sidebarManager.CLOSED_SIZE)
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
            .background(Color.gray)
            .ignoresSafeArea()
    }
}
#endif


//struct Sidebar: View {
//    @StateObject var sidebarManager = SidebarNavigationManager.shared
//
//    var body: some View {
//        ZStack {
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .background(.black.opacity(0.2))
//            .opacity(sidebarManager.isShowUser ? 1 : 0)
//            .animation(.easeInOut.delay(0.2), value: sidebarManager.isShowUser)
//            .onTapGesture {
//                sidebarManager.isShowUser.toggle()
//            }
//
//            GeometryReader { geo in
//                SidebarContent(manager: sidebarManager)
//                    .frame(
//                        minWidth: sidebarManager.isOpened ? sidebarManager.openWidth : sidebarManager.closedWidth,
//                        maxWidth: sidebarManager.isOpened ? sidebarManager.openWidth : sidebarManager.closedWidth
//                    )
//                    .animation(.default, value: sidebarManager.isOpened)
//                    .onChange(of: geo.size.width) { newValue in
//                        sidebarManager.sidebarWidth = newValue
//                    }
//            }
//            .zIndex(1)
//
//            GeometryReader { geo in
//                SidebarUserView(manager: sidebarManager)
//                    .animation(.default, value: sidebarManager.isShowUser)
//                    .onChange(of: geo.size.width) { newValue in
//                        sidebarManager.sidebarWidth = newValue
//                    }
//            }
//            .zIndex(0)
//        }
//    }
//}
