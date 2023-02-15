//
//  GeometryStackReader.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 21/01/23.
//

import SwiftUI

struct GeometryStackReader<Content: View>: View {
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGSize {
            var size = CGSize()
            size.width = .infinity
            size.height = 10
            return size
        }
        static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
            value = nextValue()
        }
    }
    
    @State private var size: CGSize = SizeKey.defaultValue
    var alignment: Alignment = .topLeading
    let content: (CGSize)->Content
    
    var body: some View {
        content(size)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: alignment
            )
            .background(GeometryReader {
                proxy in
                Color.clear
                    .preference(key: SizeKey.self, value: proxy.size)
                    .onPreferenceChange(SizeKey.self) { size = $0 }
            })
    }
}
