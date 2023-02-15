//
//  CalendarHeaderView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 20/01/23.
//

import SwiftUI

struct CalendarHeaderView: View {
    @State var height: CGFloat
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                HStack {
                    Spacer()
                    Text("Calendario")
                        .font(.system(size: 40))
                        .frame(
                            maxWidth: geo.size.width / 2,
                            maxHeight: geo.size.height,
                            alignment: .center
                        )
                        .minimumScaleFactor(0.1)
                        .scaledToFit()
                    Spacer()
                    Spacer()
                    Image("calendar-plus")
                        .resizable()
                        .frame(
                            maxWidth: geo.size.height * 0.75,
                            maxHeight: geo.size.height * 0.75
                        )
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: height)
//            Text(CalendarManager.getWeekOfYear())
//                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
    }
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView(height: 100)
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
