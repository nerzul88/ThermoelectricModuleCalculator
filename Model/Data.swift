//
//  Data.swift
//  ThermoelectricModuleCalculator
//
//  Created by Александр Касьянов on 21.09.2021.
//

import UIKit
//разницы температур холодного и горячего спаев ТЭМ
enum DT: Double, CaseIterable {
    case dT69 = 69, dT70, dT71, dT72, dT73, dT74
}

//эмпирические коэффициенты
enum Coef: CaseIterable {
    //коэффициенты для расчета силы тока
    enum Imax: Double, CaseIterable {
        case dT69 = 4.629
        case dT70 = 4.663
        case dT71 = 4.696
        case dT72 = 4.729
        case dT73 = 4.761
        case dT74 = 4.83
    }
    //коэффициенты для расчета мощности
    enum Qmax: Double, CaseIterable {
        case dT69 = 0.3541
        case dT70 = 0.3576
        case dT71 = 0.3611
        case dT72 = 0.3646
        case dT73 = 0.3681
        case dT74 = 0.3826
    }
    //коэффициенты для расчета напряжения
    enum Umax: Double, CaseIterable {
        case dTAll = 0.1244
    }
    //коэффициенты для расчета сопротивления
    enum Rac: Double, CaseIterable {
        case dT69 = 0.0207
        case dT70 = 0.0205
        case dT71 = 0.0202
        case dT72 = 0.02
        case dT73 = 0.0198
        case dT74 = 0.0196
    }
    //коэффициенты для расчета Km
    enum Km: Double, CaseIterable {
        case dT69 = 3.212
        case dT70 = 3.176
        case dT71 = 3.139
        case dT72 = 3.104
        case dT73 = 3.069
        case dT74 = 3.124
    }
}

//заголовки
struct LabelsNames {
    //названия строк таблицы ТЕЕ
    let teeTableRowsLabels = ["dT, K", "Imax, A", "Qmax, W", "Umax, V", "Rac, Ohm", "Em, mV/K", "Km, W/K"]
    //названия строк таблицы керамики
    let ceramicTableRowsLabels = ["dT, K", "Rt, К/Вт"]
    //названия столбцов
    let columnsLabels = ["69", "70", "71", "72", "73", "74"]
}

//параметры для расчёта ТЭЭ
struct TEEParams {
    //количество пар ТЭЭ по умолчанию
    var teeCount: Double = 127
    //сечение ТЭЭ по умолчанию
    var teeCross: Double = 1.4
    //высота ТЭЭ по умолчанию
    var teeHeight: Double = 1.6
    //гамма
    var gamma: Double {
        get { teeHeight / teeCross / teeCross }
    }
    //значения по умолчанию для расчёта ТЭЭ
    var iMaxResult = [Double]()
    var qMaxResult = [Double]()
    var uMaxResult: Double = 0.1
    var rAcResult = [Double]()
    var emResult: Double = 52.66
    var kmResult = [Double]()
}

//параметры для расчёта керамики
struct CeramicParams {
    //ширина керамики
    var ceramicWidth: Double = 40
    //длина керамики
    var ceramicLength: Double = 40
    //толщина керамики
    var ceramicThickness: Double = 0.89
    //теплопроводность керамики
    var ceramicThermalCond: Double = 25
    //тепловое сопротивление керамики
    var ceramicThermalResist: Double {
        get { ceramicThickness / ceramicWidth / ceramicLength / ceramicThermalCond * 1000 }
    }
    //значение по умолчанию для расчёта теплового сопротивления ТЭМ
    var temThermalResist = [Double]()
}
