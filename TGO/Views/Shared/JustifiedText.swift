//
//  JustifiedText.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 21/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct JustifiedText: UIViewRepresentable {
    let value: String
    let font: UIFont
    let fontColor: Color
    @Binding var dynamicHeight: CGFloat
    let maxHeight: CGFloat
    var lineLimit: Int = .max
    
    func makeUIView(context: Context) -> UILabel {
        let view = UILabel()
        view.textAlignment = .justified
        view.numberOfLines = lineLimit
        view.font = font
        view.textColor = UIColor(fontColor)
        view.lineBreakMode = .byWordWrapping
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = value
        DispatchQueue.main.async {
            var height = uiView.sizeThatFits(CGSize(width: uiView.bounds.width, height: CGFloat.greatestFiniteMagnitude)).height
            height = height > maxHeight ? maxHeight : height
            dynamicHeight = height
        }
    }
}
