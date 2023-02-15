//
//  CalendarView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 20/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct CalendarWidget2: View {
    var body: some View {
        VStack(spacing: 0) {
            CalendarHeaderView(height: 40)
            CalendarBodyView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(10)
        .background(Color("white-gray"))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 3)
    }
}

class CalendarWidget: UIView {
    lazy var hstack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.backgroundColor = .black
        stack.layer.opacity = 0.2
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(hstack)
        
        hstack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 14, *)
struct CalendarWidget_Preview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        CalendarWidget().showPreview()
            .background(Color.white)
            .ignoresSafeArea()
    }
}
#endif

