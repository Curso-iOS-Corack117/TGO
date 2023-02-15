//
//  NotificationCellView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 27/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct NotificationCellView: View {
    @State var height: CGFloat = .zero
    @State var revealDetails = true
    
    var body: some View {
        DisclosureGroup(isExpanded: $revealDetails) {
            JustifiedText(
                value: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse mollis sollicitudin ipsum lacinia suscipit. Fusce venenatis, elit a maximus efficitur, felis ligula fringilla risus, ac fermentum odio turpis a sem.",
                font: .systemFont(ofSize: 14), fontColor: .black, dynamicHeight: $height, maxHeight: .infinity)
            .frame(minHeight: height)
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                Label {
                    Text("Título")
                } icon: {
                    Image(systemName: "info.circle")
                        .foregroundColor(.red)
                }
                .font(.title3)
                Text("Tipo de notifiación")
                    .font(.subheadline)
            }
        }
        .tint(.black)
        .onAppear {
//            Previene bug de salto en animación al abir notificación
            revealDetails = false
        }
    }
}
