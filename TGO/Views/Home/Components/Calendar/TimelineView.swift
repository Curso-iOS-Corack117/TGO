//
//  TimelineView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 20/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct TimelineView: View {
    private let calendarManager = CalendarManager.shared
    private var hours: [String] = []
    
    init() {
        for n in 0...24 {
            var number = Double(n)
            if number == 24 { number = 0 }
            let hour = String(format: "%2d:%02d", Int(number), Int((number * 60).truncatingRemainder(dividingBy: 60)))
            hours.append(hour)
        }
    }
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(spacing: 0) {
                    ForEach(hours.indices, id: \.self) { index in
                        VStack(spacing: 0) {
                            HStack(spacing: 8) {
                                Text(hours[index])
                                    .font(.system(size: 9))
                                    .frame(width: 28, height: 20, alignment: .center)
                                VStack {
                                    Divider()
                                }
                            }
                            .frame(maxHeight: 10)
                            if index == 12 {
                                TimelineHourView(events: exampleEvents[2], minHeight: 30)
                                    .fixedSize(horizontal: false, vertical: true)
                            } else if index % 2 == 0 {
                                TimelineHourView(events: exampleEvents[0], minHeight: 30)
                                    .fixedSize(horizontal: false, vertical: true)
                            } else if index % 2 != 0 {
                                TimelineHourView(events: exampleEvents[1], minHeight: 30)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                }
                .padding(.top)
                Spacer()
            }
        }
        .padding(.bottom, 32)
        .ignoresSafeArea()
    }
}
