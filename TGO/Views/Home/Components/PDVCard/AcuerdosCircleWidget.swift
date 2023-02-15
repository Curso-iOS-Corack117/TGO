//
//  AcuerdosCircleView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 19/01/23.
//

import SwiftUI
@available(iOS 16, *)
struct AcuerdosCircleWidget: View {
    @State private var scaled: Int = 0
    @State var widgetSize: CGFloat
    
    private let lineWidth: CGFloat
    private var percentageScaled: Double {
        return Double(scaled) / 100
    }
    var percentage: Int
    
    init(percentage: Int, widgetSize: CGFloat) {
        self.percentage = percentage
        self.widgetSize = widgetSize
        self.lineWidth = widgetSize * 0.05
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Acuerdos")
                    .font(.headline)
                    .frame(
                        maxWidth: geo.size.width,
                        maxHeight: geo.size.height / 5,
                        alignment: .center
                    )
                    .minimumScaleFactor(0.2)
                .bold()
                GeometryReader { geo in
                    ZStack {
                        Group {
                            Circle()
                                .stroke(.gray, lineWidth: lineWidth)
                            Circle()
                                .trim(from: 0, to: percentageScaled)
                                .stroke(
                                    Color("gs-yellow"),
                                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                                )
                                .rotationEffect(.degrees(-90))
                                .overlay {
                                    VStack {
                                        Text("\(percentage)%")
                                            .bold()
                                    }
                                }
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.scaled = percentage
                                    }
                                }
                        }
                        .frame(
                            minWidth: geo.size.height - lineWidth,
                            maxWidth: geo.size.height - lineWidth,
                            minHeight: geo.size.height - lineWidth,
                            maxHeight: geo.size.height - lineWidth
                        )
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .padding(5)
        .frame(
            minWidth: widgetSize,
            maxWidth: widgetSize,
            minHeight: widgetSize,
            maxHeight: widgetSize
        )
    }
}

