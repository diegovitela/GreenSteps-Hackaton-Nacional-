//
//  FirstView.swift
//  GreenSteps
//
//  Created by iOS Lab on 23/04/24.
//

import SwiftUI
import Charts

struct ChartDataInt: Identifiable {
    let type: String
    let count: Int
    
    var id: String {
        return type
    }
}

struct ChartDataDouble: Identifiable {
    let type: String
    let count: Double
    let color: String
    
    var id: String {
        return type
    }
}

struct FirstView: View {
    let dataLuz = [
        ChartDataInt(type: "Jan 2024", count: 270),
        ChartDataInt(type: "Feb 2024", count: 280),
        ChartDataInt(type: "Mar 2024", count: 250),
        ChartDataInt(type: "Apr 2024", count: 200)
    ]
    let dataAgua = [
        ChartDataInt(type: "Jan 2024", count: 150),
        ChartDataInt(type: "Feb 2024", count: 180),
        ChartDataInt(type: "Mar 2024", count: 130),
        ChartDataInt(type: "Apr 2024", count: 100)
    ]
    let dataGas = [
        ChartDataInt(type: "Jan 2024", count: 300),
        ChartDataInt(type: "Feb 2024", count: 280),
        ChartDataInt(type: "Mar 2024", count: 250),
        ChartDataInt(type: "Apr 2024", count: 220)
    ]
    
    let dataPie = [
        ChartDataDouble(type: "Luz", count: 0.2, color: "yellow"),
        ChartDataDouble(type: "Agua", count: 0.5, color: "blue"),
        ChartDataDouble(type: "Gasolina", count: 0.3, color: "green")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    GroupBox ("Luz (Tons. de CO2)") {
                        Chart {
                            ForEach(dataLuz) { dataPoint in
                                BarMark(
                                    x: .value("Type", dataPoint.type),
                                    y: .value("Value", dataPoint.count)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .annotation(position: .top) {
                                    Text(String(dataPoint.count))
                                }
                            }
                        }
                        .chartYAxis(.hidden)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.yellow, .orange],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(height: 150)
                    }
                    .padding(.horizontal)
                    
                    //-------
                    
                    GroupBox("Agua (Tons. de CO2)") {
                        Chart {
                            ForEach(dataAgua) { dataPoint in
                                BarMark(
                                    x: .value("Type", dataPoint.type),
                                    y: .value("Value", dataPoint.count)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .annotation(position: .top) {
                                    Text(String(dataPoint.count))
                                }
                            }
                        }
                        .chartYAxis(.hidden)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.cyan, .blue],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(height: 150)
                    }
                    .padding(.horizontal)
                    //-------
                    
                    GroupBox("Gasolina (Tons. de CO2)") {
                        Chart {
                            ForEach(dataGas) { dataPoint in
                                BarMark(
                                    x: .value("Type", dataPoint.type),
                                    y: .value("Value", dataPoint.count)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .annotation(position: .top) {
                                    Text(String(dataPoint.count))
                                }
                            }
                        }
                        .chartYAxis(.hidden)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.mint, .green],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(height: 150)
                    }
                    .padding(.horizontal)
                    
                    //------
                    GroupBox("Emiciones de CO2 por categoría") {
                        Chart {
                            ForEach(dataPie) { dataPoint in
                                SectorMark(
                                    angle: .value(
                                        Text(verbatim: dataPoint.type),
                                        dataPoint.count
                                    ),
                                    innerRadius: .ratio(0.6)
                                )
                                .foregroundStyle(
                                    by: .value(
                                        Text(verbatim: dataPoint.type),
                                        dataPoint.type
                                    )
                                )
                                .annotation(position: .overlay) {
                                    Text("\(Int(dataPoint.count * 100))%")
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .frame(height: 300)
                    }
                    .padding(.horizontal)
                }
                .navigationBarTitle("Stats", displayMode: .large)
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

