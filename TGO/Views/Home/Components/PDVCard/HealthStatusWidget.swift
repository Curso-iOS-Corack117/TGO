//
//  HealthStatusView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 19/01/23.
//

import SwiftUI

struct HealthStatusWidget: View {
    @State var widgetSize: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Estado de salud")
                    .frame(
                        maxWidth: geo.size.width * 0.8,
                        maxHeight: geo.size.width / 6,
                        alignment: .center
                    )
                    .font(.title)
                    .minimumScaleFactor(0.2)
                Spacer(minLength: 0)
                Spacer(minLength: 0)
                rowIcons(images: ["map-marked-alt", "check-square"])
                    .frame(maxWidth: .infinity, maxHeight: geo.size.width * 0.25)
                Spacer(minLength: 0)
                    .frame(maxHeight: geo.size.width * 0.1)
                rowIcons(images: ["material-note-add", "exclamation-triangle"])
                    .frame(maxWidth: .infinity, maxHeight: geo.size.width * 0.25)
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
            .background(Color("background-widget"))
            .cornerRadius(5)
            .clipped()
            .padding([.top, .bottom], 5)
        }
        .frame(
            minWidth: widgetSize,
            maxWidth: widgetSize,
            minHeight: widgetSize,
            maxHeight: widgetSize
        )
        .shadow(color: .black.opacity(0.5), radius: 3)
    }
}

struct HealthStatusWidget_Previews: PreviewProvider {
    static var previews: some View {
        HealthStatusWidget(widgetSize: 300)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}

struct rowIcons: View {
    var images: [String]
    
    var body: some View {
        GeometryReader { innerGeo in
            HStack {
                Spacer(minLength: 0)
                Icon(image: images.first!, size: innerGeo.size.height - 20)
                Spacer(minLength: 0)
                Icon(image: images.last!, size: innerGeo.size.height - 20)
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct Icon: View {
    var image: String
    var size: CGFloat
    
    var body: some View {
        Image(image)
            .resizable()
            .foregroundColor(.black)
            .scaledToFit()
            .frame(
                minWidth: size,
                maxWidth: size,
                minHeight: size,
                maxHeight: size
            )
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 3)
                .fill(.white)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 5)
            )
    }
}
