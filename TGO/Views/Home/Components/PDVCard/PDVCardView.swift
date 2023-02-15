//
//  PDVCardView.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 18/01/23.
//

import SwiftUI

@available(iOS 16, *)
struct PDVCardView: View {
    @State var pdv: PDV
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .trailing) {
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        Group {
                            GerenteResumeWidget(
                                nombrePDV: "\(pdv.idString) " + pdv.nombrePDV,
                                image: pdv.imageUrl,
                                nombre: pdv.nombreGerente,
                                noCuenta: pdv.noEmpleadoGerente,
                                widgetSize: geo.size.height
                            )
                            ORCWidget(widgetSize: geo.size.height)
//                            HealthStatusWidget(widgetSize: geo.size.height)
//                                .frame(
//                                    idealWidth: geo.size.height,
//                                    maxWidth: geo.size.height,
//                                    minHeight: 0,
//                                    maxHeight: geo.size.height
//                                )
//                            AcuerdosCircleWidget(percentage: 85, widgetSize: geo.size.height)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack {
                    Button {
                        //                        Aun no definido
                    } label: {
                        Image(systemName: "arrow.up.left.and.arrow.down.right")
                            .padding(3)
                            .rotationEffect(.degrees(90))
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(5)
                            .shadow(color: .black.opacity(0.5), radius: 2)
                            .frame(
                                maxWidth: geo.size.height / 5,
                                maxHeight: geo.size.height / 5
                            )
                    }
                    Spacer()
                    Button {
                        //                        Aun no definido
                    } label: {
                        Circle()
                            .frame(maxWidth: geo.size.height / 5)
                            .cornerRadius(.infinity)
                            .foregroundColor(Color("gs-yellow"))
                            .overlay {
                                Image(systemName: "plus")
                                    .foregroundColor(Color("plus-button-color"))
                            }
                            .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                }
            }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 150,
            maxHeight: 150
        )
        .padding(10)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.5), radius: 3)
        .scaleEffect(1)
    }
}
