//
//  CalendarBodyView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 20/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct CalendarBodyView: View {
    var body: some View {
//        originalmente era solo TimelineView()
        HStack {
            VStack {
                Text(CalendarManager.headerDate(of: Date()))
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 14))
                TimelineView()
            }
            VStack {
                Text(CalendarManager.headerDate(of: Date.tomorrow))
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 14))
                TimelineView()
            }
            VStack {
                Text(CalendarManager.headerDate(of: Date.tomorrow.dayAfter))
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 14))
                TimelineView()
            }
        }
    }
}
