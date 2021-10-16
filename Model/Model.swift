//
//  Model.swift
//  ThermoelectricModuleCalculator
//
//  Created by Александр Касьянов on 21.09.2021.
//

import UIKit

class Calculation {
    
    //расчёт силы тока
    func iMaxCalc(gamma: Double) -> [Double] {
        Coef.Imax.allCases.map{1 / gamma * $0.rawValue}
    }
    //расчёт мощности
    func qMaxCalc(gamma: Double, teeCount: Double) -> [Double] {
        Coef.Qmax.allCases.map{teeCount / gamma * $0.rawValue}
    }
    //расчёт напряжения
    func uMaxCalc(teeCount: Double) -> Double {
        teeCount * Coef.Umax.dTAll.rawValue
    }
    //расчёт мощности
    func rAcCalc(gamma: Double, teeCount: Double) -> [Double] {
        Coef.Rac.allCases.map{teeCount * gamma * $0.rawValue}
    }
    //расчёт Em
    func emCalc(uMax: Double) -> Double {
        uMax / 0.3
    }
    //расчёт Km
    func kmCalc(gamma: Double, teeCount: Double) -> [Double] {
        Coef.Km.allCases.map{teeCount / gamma / 1000 * $0.rawValue}
    }
    //расчёт теплового сопротивления ТЭМ
    func temThermalResist(km: [Double], ceramicThermalResist: Double) -> [Double] {
        km.map{2 * ceramicThermalResist + 1 / $0}
    }
}

extension Double {
    var cut: Double {
        return Double(String(format: "%.2f", self))!
    }
}

