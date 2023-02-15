//
//  NotificationListView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 27/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct NotificationListView: View {
    var themes: [ThemeEvent] = [
        ThemeEvent.lavender,
        ThemeEvent.seafoam
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...4, id: \.self) { index in
                    NotificationCellView()
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 10)
                        .background(themes[index % 2].mainColor)
                        .cornerRadius(10)
                }
            }
            .foregroundColor(.black)
        }
    }
}
