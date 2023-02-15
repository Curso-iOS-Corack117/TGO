//
//  NotificationPaneView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 27/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct NotificationPaneView: View {
    @StateObject var manager = NotificationPaneManager.shared
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                GeometryReader { _ in
                    EmptyView()
                }
                .background { Color.black.opacity(0.0001) }
                .opacity(manager.isShow ? 1 : 0)
                .animation(.easeInOut, value: manager.isShow)
                .onTapGesture {
                    withAnimation {
                        manager.isShow.toggle()
                    }
                }
                
                VStack {
                    Text("Notificaciones")
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                    NotificationListView()
                }
                .frame(
                    minWidth: manager.paneWidth,
                    maxWidth: manager.paneWidth,
                    minHeight: manager.paneHeight,
                    maxHeight: manager.paneHeight
                )
                .padding(10)
                .background(.white.opacity(0.5))
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.8), radius: 3)
                .padding()
                .offset(manager.isShow ? manager.offsetShowed : manager.offsetHidden)
                .onAppear {
                    manager.paneSize = geo.size.width * 0.3
                }
            }
            .onChange(of: geo.size.width) { newSize in
                manager.paneSize = newSize * 0.3
            }
        }
    }
}
