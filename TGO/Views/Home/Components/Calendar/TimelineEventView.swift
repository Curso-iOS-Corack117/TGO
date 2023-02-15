//
//  TimelineEventView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 21/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct TimelineEventView: View {
    @State private var height: CGFloat = .zero
    @State var event = OldCalendarEvent(title: "Visita PDV 1990", shortDescription: "Revision de PDV y acuerdos realizados para su mejoria", date: Date(), theme: .indigo)
    
    var body: some View {
        GeometryStackReader { size in
            VStack(spacing: 3) {
                Group {
                    Text(event.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .minimumScaleFactor(1)
                        .lineLimit(2)
//                    originalmente no tería fixedsize ni el frame
                        .fixedSize(horizontal: false, vertical: true)
                    VStack {
                        JustifiedText(
                            value: event.shortDescription,
                            font: .systemFont(ofSize: 10),
                            fontColor: event.theme.accentColor,
                            dynamicHeight: $height,
                            maxHeight: 110,
                            lineLimit: .max
                        )
                        .frame(minHeight: height)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .frame(maxWidth: size.width, minHeight: 20, alignment: .leading)
            }
            .frame(
                maxWidth: .infinity,
                minHeight: 30,
                maxHeight: .infinity
            )
        }
        .padding(5)
        .background(event.theme.mainColor)
        .foregroundColor(event.theme.accentColor)
        .cornerRadius(5)
    }
}
