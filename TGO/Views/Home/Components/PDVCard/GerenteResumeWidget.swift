//
//  GerenteResumeView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 19/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct GerenteResumeWidget: View {
    @State var widgetSize: CGFloat
    
    var nombrePDV: String
    var image: String
    var nombre: String
    var noCuenta: Int
    
    
    init(nombrePDV: String, image: String, nombre: String, noCuenta: Int, widgetSize: CGFloat) {
        self.nombrePDV = nombrePDV
        self.image = image
        self.nombre = nombre
        self.noCuenta = noCuenta
        self.widgetSize = widgetSize
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 10) {
                Text(nombrePDV)
                    .frame(
                        maxWidth: geo.size.width,
                        maxHeight: geo.size.width / 6,
                        alignment: .leading
                    )
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 40))
                    .minimumScaleFactor(0.2)
                    .scaledToFill()
                    .lineLimit(2)
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        minWidth: geo.size.width * 0.45,
                        maxWidth: geo.size.width * 0.45,
                        minHeight: geo.size.width * 0.45,
                        maxHeight: geo.size.width * 0.45
                    )
                    .background(.gray)
                    .cornerRadius(.infinity)
                    .overlay( ///
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(Color("gs-yellow"), lineWidth: 3)
                    )
                VStack(spacing: 5) {
                    Text(nombre)
                        .frame(
                            maxWidth: geo.size.width * 0.9,
                            maxHeight: geo.size.width / 10
                        )
                        .font(.subheadline)
                        .scaledToFit()
                        .minimumScaleFactor(0.4)
                    Text(String(noCuenta))
                        .frame(
                            maxWidth: geo.size.width * 0.25
                        )
                        .font(.subheadline)
                        .scaledToFit()
                        .minimumScaleFactor(0.2)
                }
            }
            .frame(maxWidth: geo.size.width, maxHeight: .infinity)
        }
        .frame(
            minWidth: widgetSize,
            maxWidth: widgetSize,
            minHeight: widgetSize,
            maxHeight: widgetSize
        )
        .clipped()
    }
}
