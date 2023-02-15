//
//  SidebarButton.swift
//  TGO
//
//  Created by Sergio Ordaz Romero on 06/02/23.
//

import UIKit

class SidebarButton: UIButton {
    var manager: SidebarNavigationManager
    var opacityTitle: Double
    var title: String = ""
    var imageName: String = ""
    var action: () -> Void
    var isSystemImage: Bool = false
    
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if isSystemImage {
            imageView.image = UIImage(systemName: imageName)!.withRenderingMode(.alwaysOriginal)
        } else {
            imageView.image = UIImage(named: imageName)
        }
        return imageView
    }()
    
    lazy var titleButton: UILabel = {
        let titleButton = UILabel(frame: .zero)
        titleButton.text = title
        titleButton.textAlignment = .right
        titleButton.font = .systemFont(ofSize: 27)
        titleButton.textColor = .black
        titleButton.alpha = opacityTitle
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        return titleButton
    }()
    
    lazy var button: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [image, UIView(frame: .zero), titleButton]
        )
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.alignment = .fill
        // Button Aciton
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(actionButton))
//        stackView.addGestureRecognizer(gesture)
        stackView.clipsToBounds = true
        return stackView
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(manager: SidebarNavigationManager, title: String = "", imageName: String = "", isSystemImage: Bool = false, action: @escaping () -> Void, opacityTitle: Double = 0) {
        self.manager = manager
        self.title = title
        self.imageName = imageName
        self.isSystemImage = isSystemImage
        self.action = action
        self.opacityTitle = opacityTitle
        if manager.isOpened {
            self.opacityTitle = 1
        }
        super.init(frame: .zero)
        setupView()
    }
    
    private func setupView() {
        addSubview(image)
        addSubview(titleButton)
//        addSubview(button)
        
//        button.snp.makeConstraints { make in
//            make.height.equalTo(manager.BUTTON_HEIGHT)
//
//        }
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(manager.BUTTON_HEIGHT)
            make.centerY.equalToSuperview()
            if !manager.isOpened {
                make.centerX.equalToSuperview()
            }
        }
        
        titleButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        addTarget(self, action: #selector(actionButton), for: .touchUpInside)
    }
    
    @objc private func actionButton() {
        action()
        titleButton.text = "hola"
        print("hola")
    }
}

#if DEBUG
import SwiftUI

@available(iOS 14, *)
struct SidebarButton_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        SidebarButton(
            manager: .init(isOpened: true),
            title: "Texto Boton",
            imageName: "material-menu",
            action: {},
            opacityTitle: 1
        ).showPreview()
            .frame(alignment: .center)
            .ignoresSafeArea()
    }
}
#endif
