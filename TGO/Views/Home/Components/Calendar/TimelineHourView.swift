//
//  TimelineWorkView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 20/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct TimelineHourView: View {
    @State var events: [OldCalendarEvent]
    @State private var isDropping: Bool = false
    var minHeight: CGFloat
    
    private let cleanEvent = OldCalendarEvent(title: "Nuevo evento")
    
    var body: some View {
        GeometryStackReader { size in
            VStack(spacing: 5) {
                Group {
                    HStack(spacing: 3) {
                        ForEach(events.indices, id: \.self) { index in
                            TimelineEventView(event: events[index])
                        }
                    }
                    if isDropping {
                        HStack(spacing: 3) {
                            TimelineEventView(event: cleanEvent)
                        }
                    }
                }
                .frame(
                    maxWidth: size.width - 36,
                    minHeight: minHeight,
                    maxHeight: .infinity
                )
                .offset(x: 36)
                .fixedSize(horizontal: false, vertical: true)
                
            }
        }
        .background(.clear)
        .onDrop(of: [.url], delegate: DropCalendarDelegate(isDropping: $isDropping))
    }
}
