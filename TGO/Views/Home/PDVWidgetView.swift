//
//  PDVWidgetView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 19/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct PDVWidgetView2: View {
    @StateObject var pdvManager = PDVWidgetManager.shared
    private let sizeHeader: CGFloat = 30
    
    var body: some View {
        VStack {
            Section {
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(pdvManager.pdvs, id: \.id) { pdv in
                            PDVCardView(pdv: pdv)
                                .onDrag {
                                    pdvManager.currentPDV = pdv
                                    return NSItemProvider(contentsOf: URL(string: "\(pdv.id)"))!
                                }
                                .onDrop(of: [.url], delegate: DropPDVDelegate(pdvDroped: pdv, withManager: pdvManager))
                        }
                    }
                    .padding(5)
                }
            } header: {
                HStack {
                    Text("Puntos de Venta")
                        .frame(maxHeight: .infinity)
                        .font(.system(size: 40))
                        .minimumScaleFactor(0.2)
                        .scaledToFit()
                    Spacer()
                    SortIcon(size: sizeHeader)
                }
                .frame(maxHeight: sizeHeader)
                .clipped()
            }
        }
        .frame(maxHeight: .infinity)
        .padding(10)
        .background(Color("white-gray"))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 3)
    }
}

class PDVWidgetView: UIView {
    lazy var hstack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.backgroundColor = .blue
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
struct PDVWidgetView_Preview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        PDVWidgetView().showPreview()
            .background(Color.white)
            .ignoresSafeArea()
    }
}
#endif
