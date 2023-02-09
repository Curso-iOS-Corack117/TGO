//
//  ViewController.swift
//  TGO
//
//  Created by Sergio Ordaz Romero on 08/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var sidebar: SidebarView = {
        let sidebar = SidebarView(frame: .zero)
        return sidebar
    }()
    
    lazy var headerView: HeaderView = {
        let headerView = HeaderView(frame: .zero)
        return headerView
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.contentInset = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        return textView
    }()
    
    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerView, textView])
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(sidebar)
        
        sidebar.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.06)
        }
        sidebar.backgroundColor = .red
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
