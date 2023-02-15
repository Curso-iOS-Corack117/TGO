//
//  SortView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 18/01/23.
//

import SwiftUI

struct SortIcon: View {
    var size: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                Group {
                    Image("material-sort")
                        .resizable()
                    Image("material-compare-arrows")
                        .resizable()
                        .scaleEffect(0.7)
                        .offset(x: geo.size.width * 0.55, y: geo.size.height * 0.15)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFit()
            }
        }
        .frame(
            minWidth: size,
            maxWidth: size,
            minHeight: size,
            maxHeight: size
        )
        .padding(4)
    }
}

struct SortIcon_Previews: PreviewProvider {
    static var previews: some View {
        SortIcon(size: 20)
            .previewLayout(.fixed(width: 40, height: 40))
    }
}
