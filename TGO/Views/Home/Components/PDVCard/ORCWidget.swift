//
//  OrcsWidget.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 19/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct ORCWidget: View {
    @State var widgetSize: CGFloat {
        willSet {
            self.widgetHeight = newValue
            self.widgetWidth = newValue * 2
        }
    }
    @State private var widgetWidth: CGFloat
    @State private var widgetHeight: CGFloat
    
    init(widgetSize: CGFloat) {
        self.widgetSize = widgetSize
        self.widgetHeight = widgetSize
        self.widgetWidth = widgetSize * 1.5
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("ORC's")
                    .frame(
                        maxWidth: 100,
                        maxHeight: geo.size.height / 8,
                        alignment: .center
                    )
                    .font(.title).bold()
                    .minimumScaleFactor(0.2)
                    .scaledToFill()
                HStack {
                    Text("Puntos Ranking")
                        .font(.title3).bold()
                        .frame(
                            maxWidth: geo.size.width / 6,
                            alignment: .leading
                        )
                        .minimumScaleFactor(0.1)
                        .scaledToFill()
                        .lineLimit(2)
                    TableORC(exp: 31.22,neg: 61.69, total: 92.91, seg: 81.03)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
            .background(Color("background-widget"))
            .cornerRadius(5)
            .padding([.top, .bottom], 5)
        }
        .frame(
            minWidth: widgetWidth,
            maxWidth: widgetWidth,
            minHeight: widgetHeight,
            maxHeight: widgetHeight
        )
        .shadow(color: .black.opacity(0.5), radius: 3)
    }
}

@available(iOS 16, *)
struct TableORC: View {
    var exp: Double
    var neg: Double
    var total: Double
    var seg: Double
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                Group {
                    ColumnORC(title: "Exp.", value: "\(exp.formatted())", extra: "1")
                        .background(Color("blue-table"))
                    ColumnORC(title: "Neg.", value: "\(neg.formatted())", extra: "4")
                        .background(Color("gray-table"))
                    ColumnORC(title: "Total", value: "\(total.formatted())", extra: "1")
                    ColumnORC(title: "Seg.", value: "\(seg.formatted())")
                        .background(Color("yellow-table"))
                }
                .frame(
                    minWidth: geo.size.width / 4,
                    maxWidth: geo.size.width / 4
                )
            }
        }
    }
}

@available(iOS 16, *)
struct ColumnORC: View {
    var title: String
    var value: String
    var extra: String = " "
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 5) {
                Spacer(minLength: 0)
                CellORC(value: title, size: geo.size.width * 0.7)
                    .bold()
                Spacer(minLength: 0)
                CellORC(value: value, size: geo.size.width * 0.7)
                Spacer(minLength: 0)
                CellORC(value: extra, size: geo.size.width * 0.3)
                    .frame(maxHeight: geo.size.width * 0.3)
                Spacer(minLength: 0)
            }
            .frame(
                minWidth: geo.size.width,
                maxHeight: .infinity,
                alignment: .center
            )
        }
    }
}

struct CellORC: View {
    var value: String
    var size: CGFloat
    
    var body: some View {
        Text(value)
            .scaledToFit()
            .frame(
                maxWidth: size,
                alignment: .center
            )
            .minimumScaleFactor(0.1)
    }
}
